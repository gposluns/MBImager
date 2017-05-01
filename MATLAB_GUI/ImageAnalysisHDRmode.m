clear all; close all;

Exp = 1;
NoPat = 1000;
NoChange = [0 4 10 16 20 17 11 5 1];
PerChange = 50;
NoFrames = 300;
DN1 = zeros(9,10);
DN2 = zeros(9,10);
DN3 = zeros(9,10);
DN4 = zeros(9,10);
TotImg0 = zeros(9,1);
TotImg1 = zeros(9,1);
j = 0;

for i=NoChange
    j = j+1;
    [ imageB1H0, imageB2H0, imageB1H1, imageB2H1, ImgSum0, ImgSum1 ] = ImageAvgHDRmode( Exp, NoPat, i, PerChange, NoFrames );
    DN1(j,:)=double(imageB1H0(74,51:60))/256;
    DN2(j,:)=double(imageB2H0(74,51:60))/256;
    DN3(j,:)=double(imageB1H1(74,51:60))/256;
    DN4(j,:)=double(imageB2H1(74,51:60))/256;
    TotImg0(j,1) = ImgSum0;
    TotImg1(j,1) = ImgSum1;
end

figure
plot(DN1)
figure
plot(DN2)
figure
plot(DN3)
figure
plot(DN4)

transpose(TotImg0)
transpose(TotImg1)
