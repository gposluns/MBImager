function out_data = loadfiles(addr, colnum, skipframes)
% colnum: column to extract, high-res px is 0
% skipframes: # of frames to skip, ie. take every 2nd, 3rd frame
% addr: image folder !! PATH MUST END IN '\'

% If address not specified
if nargin < 3
   skipframes = 1;
end
if nargin < 2
   colnum = 1;
end
if nargin < 1
   addr = 'reconstructme\';
end

nRow = 214;
nCol = 32;
files = dir(strcat(addr, '*.bmp'));

nfiles = floor(length(files)/skipframes);
out_data = zeros(nfiles, nRow, nCol);

% brightimage = imread('brightimage.bmp');

for file = files'
   temp = imread(strcat(addr, file.name));
   % targetim = 256-(brightimage-temp);
   [~, name, ~] = fileparts(file.name);
   image_num = str2num(name(2:end)) + 1;
   
   if mod(image_num, skipframes) == 0
      out_data(image_num, :, :) = temp(:, colnum*32+1:(colnum+1)*32);
   end
end
