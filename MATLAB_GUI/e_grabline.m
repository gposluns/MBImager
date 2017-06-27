function o_lines = e_grabline(all_data, rownum, deltaframe, currWrapNum, coarse, nRow)
    % rownum = 214
    % wrapNum is the number of deltaframe offsets
    datasize = size(all_data);

    if nargin < 3
       deltaframe = 0;
       currWrapNum  = 0;
       coarse = 0;
       nRow = 214;
    elseif nargin < 6
       nRow = 214;
    end
    
    nCol = 32;
    N = 8;
    
    o_lines = zeros(nRow, nCol);

    % Rows to grab pixels from
    % subpxRows = [211:-deltaPixel:15];
    % 5, 10, 15, 20, 25, 30

    for i = 1:nRow
        for j = 1:32  % columns
            % offset by deltaframe to line up the target image for reconstruction
            % coarse value is to correct for minor deltas in aligning the image
            frame2grab = i + currWrapNum*(deltaframe) + floor(currWrapNum*coarse);
            o_lines(i, j) = all_data(frame2grab, rownum, j);
        end
    end
end
