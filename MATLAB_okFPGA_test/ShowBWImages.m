function frame=ShowBWImages(obj)
% This funtion resets the fifo and triggers the counter the start counting
% obj is an object representing the board

    % reset the fifo
    ok.setwireinvalue(obj,hex2dec('10'),hex2dec('01'), 1);
    ok.updatewireins(obj);
    ok.setwireinvalue(obj,hex2dec('10'),hex2dec('00'), 1);
    ok.updatewireins(obj);
    
    % activate the counter
    ok.activatetriggerin(obj, hex2dec('53'), 1); 


%     full=0;
%     % while ~full
%     for i = 1:50
%         ok.updatetriggerouts(obj);
% 
%         full = ok.istriggered(obj,hex2dec('6A'), 1); % full
%         oneFrameReady = ok.istriggered(obj,hex2dec('6A'), 4); % one frame ready
% 
%         if full
%             fullFrame = ok.readfrompipeout(obj, hex2dec('A0'),131072);
%             showOneFrame( fullFrame );
%             pause(0.001);
%             ok.activatetriggerin(obj, hex2dec('53'), 2);
%         elseif oneFrameReady
%             oneFrame = ok.readfrompipeout(obj, hex2dec('A0'),51200);
%             showOneFrame( oneFrame );
%             pause(0.001);
%         end
% 
%     end

end


