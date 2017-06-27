close all; clear all;
Exp = 1;
NoPat = 1000;
NoChange = [0 1 2 3 4 5 6 7 8 9];
% NoChange = 0;
PerChange = 100;
NoFrames = 300;

for i = NoChange
    Foldername=['DataCollect\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(i) '_' num2str(PerChange) '_B1'];
    imageB1 = imread([Foldername 'Images_Analysis_Image_avg_B1.png']);
    imageB2 = imread([Foldername 'Images_Analysis_Image_avg_B2.png']);
    PDCim1 = uint8(imageB1(2:80,3:62)/255);
    PDCim2 = uint8(imageB2(2:80,3:62)/255);
    figure
%     figure(i+1) = figure
%     axes1(i+1) = axes('Parent',figure(i+1));
%     hold(axes1(i+1),'on');
    axis([0 255 0 3000])
    histogram(PDCim1,'BinLimits',[0.5 254.5],'BinWidth',1)
    hold on
    histogram(PDCim2,'BinLimits',[0.5 254.5],'BinWidth',1)    
end



