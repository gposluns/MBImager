close all; clear all;
Exp = 1;
NoPat = 500;
NoChange = [2 10 20 11 1];
% NoChange = 0;
PerChange = 25;
NoFrames = 1; 
j=0;
figure

for i = NoChange
    j = j+1;
    FoldernameB1H0=['DataCollect\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(i) '_' num2str(PerChange) '_B1'];
    FoldernameB2H0=['DataCollect\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(i) '_' num2str(PerChange) '_B2'];
    imageB1 = imread([FoldernameB1H0 '\Images_Analysis_Image1_B1.png']);
    imageB2 = imread([FoldernameB2H0 '\Images_Analysis_Image1_B2.png']);
    PDCim1 = imageB1(1:80,3:62);
    PDCim2 = imageB2(1:80,3:62);
    imwrite(PDCim1,['Image' num2str(j) '_B1.png'])
    imwrite(PDCim2,['Image' num2str(j) '_B2.png'])
    hold on
    subplot(2,5,(j))
    imshow(PDCim1)
    subplot(2,5,(j+5))
    imshow(PDCim2)
end



