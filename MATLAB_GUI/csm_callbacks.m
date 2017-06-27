classdef csm_callbacks
    properties
        Address % [Read Address, Write Address]

        ptr
        Dropped = 0
        readaddr = 0
        writeaddr = 0
        filename = 'relv2.1_nodebsig.bit'
        nFrames = 8

        FRAME_SIZE = 54784
        FIFO_SIZE = 32768
        HEIGHT = 214
        WIDTH = 256
    end % properties

    methods
         function obj = csm_callbacks
            % Initialization steps of the function
            if ~libisloaded('okFrontPanel')
               loadlibrary('okFrontPanel', 'okFrontPanelDLL.h', 'notempdir');
            end
            obj.ptr = calllib('okFrontPanel', 'okFrontPanel_Construct');

            while ok.isfrontpanelenabled(obj) == 0
               % Open connection
               disp('Opening connection');
               ok.openbyserial(obj, '');

               % Configuring
               disp('Configuring FPGA');
               ok.configurefpga(obj, obj.filename);
            end

        end
        function close(obj)
            % Housekeeping tasks before exit
            calllib('okFrontPanel', 'okFrontPanel_Destruct', obj.ptr);
            unloadlibrary('okFrontPanel');
        end
        function start(obj, guiObj)

            % Get data from the OK board
            disp('Start button was clicked');
            set(guiObj, 'Enable', 'off');

            hMain = getappdata(0, 'hMain');
            setappdata(hMain, 'cnt', 0);
            ok.setwireinvalue(obj, 0, hex2dec('ffffffff'), 1);
            ok.setwireinvalue(obj, 0, hex2dec('ffffffff'), 2);
            ok.setwireinvalue(obj, 0, 255*4              , hex2dec('7fc'));
            ok.updatewireins(obj);
        end
        function save(obj, handles)
            % Save data to disk
            hMain = getappdata(0, 'hMain');
            myFrame = getappdata(hMain, 'Image');
            imwrite(double(myFrame)./256, 'frame.bmp');
            csvwrite('frame.csv', myFrame.*256);
        end
        function handles = timerUpdate(obj, handles)
        % Update the image on clk frequency timer
            ok.updatewireouts(obj);
            wireout20 = uint64(ok.getwireoutvalue(obj, hex2dec('20')));
            % Do bit shifts to get the ranges that we want
            obj.writeaddr = bitshift(bitand(wireout20, hex2dec('7fff0000')), -16);  % MSB is obj.writeaddr
            obj.readaddr = bitand(wireout20, hex2dec('00007fff')); % LSB is obj.readaddr

            % Check for trigger
%             ok.updatetriggerouts(obj);
%             if (ok.istriggered(obj, hex2dec('60'), hex2dec('1')))
%                 set(obj.lblDropped, 'String', ['Triggered: TRUE']);
%             end
% 
%             ok.activatetriggerin(obj, hex2dec('40'), hex2dec('0'))
            
            hMain = getappdata(0, 'hMain');
            if (((obj.writeaddr>=obj.readaddr)&&(obj.writeaddr-obj.readaddr>obj.FRAME_SIZE/4+5)) ... 
                || ((obj.writeaddr<obj.readaddr)&&((obj.FIFO_SIZE-(obj.readaddr-obj.writeaddr)) >obj.FRAME_SIZE/4+5)))

                local_frame = ok.readfrompipeout(obj, hex2dec('A0'), obj.FRAME_SIZE);

                axes(handles.imout);
                % handles.myFrame = imdiv(reshape(local_frame, [obj.WIDTH, obj.HEIGHT])', handles.Imdiv);
                % imshow(double(handles.myFrame)./256);
                myFrame = imdiv(reshape(local_frame, [obj.WIDTH, obj.HEIGHT])', handles.Imdiv);

                % apply dark image subtraction
                if isappdata(hMain, 'DarkImage')
                    darkFrame = getappdata(hMain, 'DarkImage'); 
                    myFrame = max(myFrame - darkFrame, 0);
                end

                if isappdata(hMain, 'BrightImage')
                    brightFrame = getappdata(hMain, 'BrightImage'); 
                    myFrame = max(256-(brightFrame-myFrame), 0);
                    %padj = floor((256-max(max(myFrame)))./256);
                    %myFrame = myFrame.*(1+padj);
                end


                imshow(double(myFrame)./256, 'parent', handles.imout);
                setappdata(hMain, 'Image', myFrame);

                % draw red outline for average pixels
                % for i = 0:obj.nFrames - 1
                %     rectangle('Position', [i*32 + 12, 12, 8, 8], 'EdgeColor', 'r', 'parent', handles.imout);
                %     rectangle('Position', [i*32 + 12, 182, 8, 8], 'EdgeColor', 'r', 'parent', handles.imout);
                % end
                
                [topavg, botavg] = pixelavg(myFrame);
                set(handles.txtTop, 'String', mat2str(topavg));
                set(handles.txtBot, 'String', mat2str(botavg));
                % set(handles.imout, 'visible', 'on');
                obj.Dropped = 0;             

                switch getappdata(hMain, 'frameStabilized')
                    case 0
                        setappdata(hMain, 'frameStabilized', 1);
                    % case 1
                    %     setappdata(hMain, 'frameStabilized', 2);
                    case 1
                        if (getappdata(hMain, 'isDark') == 1 || getappdata(hMain, 'isBright') == 1);
                            setappdata(hMain, 'frameStabilized', 2);
                        elseif getappdata(hMain, 'enAutoSave')
                            mycnt = getappdata(hMain, 'cnt');

                            % Shutdown once exceeds x frames
                            if mycnt > 1000
                                setappdata(hMain, 'Shutdown', 1)
                            end

                            imwrite(double(myFrame)./256, ['reconstructme/f' int2str(mycnt) '.bmp']);
                            mycnt = mycnt+1;
                            setappdata(hMain, 'cnt', mycnt);

                            setappdata(hMain, 'isRead', 2);
                            setappdata(hMain, 'frameStabilized', 0);
                        else
                            setappdata(hMain, 'isRead', 1);
                            setappdata(hMain, 'frameStabilized', 0);
                        end
                    case 2
                        setappdata(hMain, 'isRead', 1);
                        if getappdata(hMain, 'isDark') == 1
                            setappdata(hMain, 'DarkImage', myFrame);    
                            imwrite(myFrame./256, 'darkimage.bmp');
                            setappdata(hMain, 'isDark', 0);
                        elseif getappdata(hMain, 'isBright') == 1
                            setappdata(hMain, 'BrightImage', myFrame);    
                            imwrite(myFrame./256, 'brightimage.bmp');
                            setappdata(hMain, 'isBright', 0);
                        end
                        setappdata(hMain, 'frameStabilized', 0);
                end
            else
                % Update counter
                obj.Dropped = obj.Dropped + 1;
                setappdata(hMain, 'isRead', 0);
            end
            
            set(handles.txt_readaddr, 'String', int2str(obj.readaddr));
            set(handles.txt_writeaddr, 'String', int2str(obj.writeaddr));
            
            % fi = fopen('wireout20.txt', 'at');
            % fprintf(fi, strcat(num2str(wireout20), '\t', num2str(obj.writeaddr), '\t', num2str(obj.readaddr), '\n'));
            % fclose(fi);
        end
        function timerError(obj, guiObj)
            disp('SNAFU');
        end
    end
end
