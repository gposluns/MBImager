function o_lines = e_grabline2(all_data, rownum, deltaframe, wrapNum, tweak)
    % rownum = 214
    % wrapNum is the number of deltaframe offsets
    datasize = size(all_data);

    if nargin < 3
        deltaframe = 0;
        wrapNum  = 0;
        tweak = 0;
    end

    nRow = 10;
    nCol = 32;
    N = 8;
    
    o_lines = zeros(nRow, nCol);

    % time change (number of frames between pixels)
    startim = 3;
    endim = 505;

    % Rows to grab pixels from
    % subpxRows = [211:-deltaPixel:15];
    % 5, 10, 15, 20, 25, 30

    for i = 0:nRow - 1
        for j = 1:32  % columns
            % offset by deltaframe to line up the target image for reconstruction
            % tweak value is to correct for minor deltas in aligning the image
            frame2grab = i+1+wrapNum*(deltaframe) + wrapNum*tweak;
            o_lines(i+1, j) = all_data(frame2grab, rownum, j);
        end
    end
end
