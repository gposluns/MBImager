clear all; close all;

Exp = 1;
NoPat = 1000;
NoChange = 0;
PerChange = 100;
NoFrames = 290;
DN1 = zeros(10,10);
DN2 = zeros(10,10);
% DN3 = zeros(9,10);
% DN4 = zeros(9,10);
TotImg = zeros(10,1);

for i=1:5
    [ imageB1, imageB2, ImgSum ] = ImageAvg( Exp, NoPat, 2*i-1, PerChange, NoFrames );
    DN1(i,:)=double(imageB1(74,51:60))/256;
    DN2(i,:)=double(imageB2(74,51:60))/256;
    TotImg(i,1) = ImgSum;
end

for i=1:5
    [ imageB1, imageB2, ImgSum ] = ImageAvg( Exp, NoPat, 2*i-2, PerChange, NoFrames );
    DN1(11-i,:)=double(imageB1(74,51:60))/256;
    DN2(11-i,:)=double(imageB2(74,51:60))/256;
    TotImg(11-i,1) = ImgSum;
end

xscale = 10:10:100;
figure
plot(xscale,DN1)
xlabel('Percentage of Mask=1 [%]')
ylabel('Digitalized output of the bucket 1')
figure
plot(xscale,DN2)
xlabel('Percentage of Mask=0 [%]')
ylabel('Digitalized output of the bucket 2')
% figure
% plot(DN3)
% figure
% plot(DN4)

transpose(TotImg)