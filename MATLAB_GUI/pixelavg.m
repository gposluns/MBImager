function [toparray, botarray] = pixelavg(iFrame)
    nFrames = 8;
    % roi_size = 8

    iFrame = iFrame.*256;

    toparray = [];
    botarray = [];
    for i = 0:nFrames - 1
        % region of interest
        roi_top = iFrame(12:20, i*32 + 12:i*32 + 20);
        roi_bot = iFrame(182:190, i*32 + 12:i*32 + 20);
        roi_top_mean = uint8(mean(mean(roi_top)));
        roi_bot_mean = uint8(mean(mean(roi_bot)));

        toparray = [toparray roi_top_mean];
        botarray = [botarray roi_bot_mean];
    end
end
