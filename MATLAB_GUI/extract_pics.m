function out_pic = extract_pics( mypics, framenum )
% Extract a picture from the giant set of frames

   figure;
   out_pic = squeeze(mypics(framenum,:,:)./256);
   imshow(out_pic);

end

