function Z=showOneFrame( frame, displayIdt,dispframe,handles, imgCalib, showHist  )
% This function arranges the data received from pipeout endpoint and
% displays and returns the resulting array/image
% frame contains the data to be processed
% displayIdt = 1 when the first arrangement method is selected
% displayIdt = 2 when the second arrangement method is selected
    
    % initialize parameters
    row=160;
    N_adc=4;
    N_adcCh=3;
    N_mux=46;
    col=N_adc*N_adcCh*N_mux;
    indiCol=184;
    
    ZT = zeros(row, col, 'uint8');
    Z = zeros(row, indiCol, 'uint8');

    % arranges the pixels <MODIFY ARRANGEMENTS HERE IF NECESSARY>
    for i=0:row-1
        for j=0:N_adc-1
            for k=0:N_adcCh-1
                for l=0:N_mux-1
                    ZT(row-i,(col-(j*N_adcCh*N_mux+(2-k)*N_mux+45-l))) = frame(i*col+l*N_adc*N_adcCh+k*N_adc+j+1);
                end
            end
        end
    end
    
    % save the arrangements according to the method selected
    % <MODIFY ARRANGEMENTS HERE IF NECESSARY>
    if displayIdt==1
        Z=ZT(:,139:2:505);
        if imgCalib && (handles.percent ~=0)
            calib = Z(2:80,3:62);
            calib = (mean(mean(handles.whiteimg1-handles.darkimg1))*(double(calib)-handles.darkimg1)./(handles.whiteimg1-handles.darkimg1))+ mean(mean(handles.darkimg1));
            calib(calib>255) = 255;
            calib(calib<0) = 0;
            calib = uint8(calib);
            Z(2:80,3:62) = calib;
        end
    else
        Z=ZT(:,140:2:506);
        
        if imgCalib && (handles.percent ~=100)
            calib = Z(2:80,3:62);
            calib = (double(calib)-handles.darkimg2)*mean(mean(handles.whiteimg2-handles.darkimg2))./(handles.whiteimg2-handles.darkimg2)+mean(mean(handles.darkimg2));
            calib(calib>255) = 255;
            calib(calib<0) = 0;
            calib = uint8(calib);
            Z(2:80,3:62) = calib;
        end
    end
    
    % display the resulting image
    if dispframe == 0
        %image = zeros(row, indiCol, 'uint8');
        image = Z;
    elseif dispframe == 2

        %image = zeros(160,120, 'uint8');
        image = Z(1:160,63:182);  
    else
        %image = zeros(80, 60, 'uint8');
        image = Z(1:80,3:62); 
    end
    imshow(image);
    if showHist
        if displayIdt==1
            axes(handles.axes3);
            imhist(image, 256);
        else
            axes(handles.axes4);
            imhist(image, 256);
        end
    end

end

