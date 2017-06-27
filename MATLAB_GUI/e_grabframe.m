function o_frame = e_grabframe(all_data, deltaframe, coarse, nRow)
   % working input values = (loadfiles(), 18, 5)
   start_row = 214;
   % deltaframe = 18;

   if nargin < 4
      nRow = 100;
   end
   nCol = 256;

   o_frame = zeros(deltaframe, nRow, nCol);

   for imagenum = 0:deltaframe - 1
      subplot(5,5,imagenum+1);
      % 32 x 8 = 256
      for i = 0:7
         row2grab = start_row - i*deltaframe - imagenum; % calculate row number to start at
         % grab the 214x32 column for the current row
         o_lines = e_grabline(all_data, row2grab, deltaframe, i, coarse, nRow);
         o_frame(imagenum+1, :, i+1:8:end) = o_lines; % wrap-around calculations for the columns
      end
      imshow(squeeze(o_frame(imagenum+1,:,:)./256));
   end
end
