function oFrame = imdiv(iFrame, div_type)

    iFrame = 255 - iFrame;
    
    switch div_type
        case 0
            oFrame = iFrame;
        case 1
            oFrame = odd_even_join(iFrame);
        case 2
            tFrame = odd_even_join(iFrame);
            oFrame = pixel_split(tFrame, 0);
        case 3
            tFrame = odd_even_join(iFrame);
            oFrame = pixel_split(tFrame, 1);
        otherwise
            oFrame = iFrame;
    end
end

function oFrame = odd_even_join( iFrame )
%% imdiv: interleave odd/even columns

    WIDTH = 256;
    HEIGHT = 214;

    oFrame = zeros(HEIGHT, WIDTH);

    for i = 1:WIDTH;
        if i <= WIDTH/2
            % EVEN, MATLAB is 1-indexed
            oFrame(:, i*2-1) = iFrame(:, i);
        elseif i > WIDTH/2
            % ODD
            oFrame(:, (i-WIDTH/2)*2) = iFrame(:, i);
        end
    end
end

function oFrame = pixel_split(iFrame, DO_SS)
%% pixel_split: split into individual pixels
    % DO_SS can be 1 or 2

    oFrame = [];
    nFrames = 8;

    WIDTH = 256;
    HEIGHT = 214;

    for i = 1:nFrames - DO_SS
        tframe = iFrame(:, i:nFrames:end);   
        oFrame = [oFrame tframe];
    end

    if (DO_SS == 1)
        % Special processing for Spectrum Sensing/Photogate pixel
        spec_row_up = iFrame(1:2:HEIGHT, nFrames-1:nFrames:end);
        spec_row_down = iFrame(2:2:HEIGHT, nFrames-1:nFrames:end);
        spec_row = [spec_row_up; spec_row_down];
        oFrame = [oFrame spec_row]; 
   end
end
