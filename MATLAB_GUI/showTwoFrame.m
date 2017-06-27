function [Z1, Z2]=showTwoFrame( frame, displayIdt )
% This function arranges the data received from pipeout endpoint and
% displays and returns the resulting array/image
% frame contains the data to be processed
% displayIdt = 1 when the first arrangement method is selected
% displayIdt = 2 when the second arrangement method is selected
    
    % initialize parameters
    frames = 2;
    row=160;
    N_adc=4;
    N_adcCh=3;
    N_mux=46;
    col=N_adc*N_adcCh*N_mux;
    indiCol=184;
    
    ZT = zeros(row, col, 'uint8');
    Z1 = zeros(row, indiCol, 'uint8');
    Z2 = zeros(row, indiCol, 'uint8');

    % arranges the pixels <MODIFY ARRANGEMENTS HERE IF NECESSARY>
    for u=0:frames-1
        for i=0:row-1
            for j=0:N_adc-1
                for k=0:N_adcCh-1
                    for l=0:N_mux-1
                        ZT((u+1)*row-i,(col-(j*N_adcCh*N_mux+(2-k)*N_mux+45-l))) = frame(u*row*N_adc*N_adcCh*N_mux+i*col+l*N_adc*N_adcCh+k*N_adc+j+1);
                    end
                end
            end
        end
    end
    % save the arrangements according to the method selected
    % <MODIFY ARRANGEMENTS HERE IF NECESSARY>
    if displayIdt==1
        Z1=ZT(1:160,140:2:506);
        Z2=ZT(161:320,140:2:506);
    else
        Z1=ZT(1:160,139:2:505);
        Z2=ZT(161:320,139:2:505);
    end
    
    % display the resulting image
    imshow(Z1);

end

