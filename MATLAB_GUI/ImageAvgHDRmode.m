function [ imageB1H0, imageB2H0, imageB1H1, imageB2H1, ImgSum0, ImgSum1 ] = ImageAvgHDRmode( Exp, NoPat, NoChange, PerChange, NoFrames )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

FoldernameB1H0=['DataCollect\HDR0\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B1'];
FoldernameB2H0=['DataCollect\HDR0\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B2'];
FoldernameB1H1=['DataCollect\HDR1\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B1'];
FoldernameB2H1=['DataCollect\HDR1\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B2'];
ImagenameB1=['Images_Analysis_Image1_B1.png'];
ImagenameB2=['Images_Analysis_Image1_B2.png'];

imageB1H0 = zeros(160,184);
imageB2H0 = zeros(160,184);
imageB1H1 = zeros(160,184);
imageB2H1 = zeros(160,184);

imageRefB1H0 = double(imread([FoldernameB1H0 '\' ImagenameB1]));
imageRefB2H0 = double(imread([FoldernameB2H0 '\' ImagenameB2]));
imageRefB1H1 = double(imread([FoldernameB1H1 '\' ImagenameB1]));
imageRefB2H1 = double(imread([FoldernameB2H1 '\' ImagenameB2]));

ImgSum0 = 0;
ImgSum1 = 0;

for ImInd = 2:NoFrames
    ImagenameB1=['Images_Analysis_Image' num2str(ImInd) '_B1.png'];
    ImagenameB2=['Images_Analysis_Image' num2str(ImInd) '_B2.png'];
    
    imageIntB1H0 = double(imread([FoldernameB1H0 '\' ImagenameB1]));
    imageIntB2H0 = double(imread([FoldernameB2H0 '\' ImagenameB2]));
    imageIntB1H1 = double(imread([FoldernameB1H1 '\' ImagenameB1]));
    imageIntB2H1 = double(imread([FoldernameB2H1 '\' ImagenameB2]));
    
    TestMat1H0 = imageIntB1H0(50:78,30:60) - imageRefB1H0(50:78,30:60);
    TestMat2H0 = imageIntB2H0(50:78,30:60) - imageRefB2H0(50:78,30:60);
    TestMat1H1 = imageIntB1H1(50:78,30:60) - imageRefB1H1(50:78,30:60);
    TestMat2H1 = imageIntB2H1(50:78,30:60) - imageRefB2H1(50:78,30:60);
    
    if max(max(abs(TestMat1H0))) < 20
        if max(max(abs(TestMat2H0))) < 20
            imageB1H0 = imageIntB1H0 + imageB1H0;
            imageB2H0 = imageIntB2H0 + imageB2H0;
            ImgSum0 = ImgSum0 + 1;
        end
    end
    
    if max(max(abs(TestMat1H1))) < 20
        if max(max(abs(TestMat2H1))) < 20
            imageB1H1 = imageIntB1H1 + imageB1H1;
            imageB2H1 = imageIntB2H1 + imageB2H1;
            ImgSum1 = ImgSum1 + 1;
        end
    end
end

imageRefB1H0 = imageB1H0/ImgSum0;
imageRefB2H0 = imageB2H0/ImgSum0;
imageRefB1H1 = imageB1H1/ImgSum1;
imageRefB2H1 = imageB2H1/ImgSum1;

RefVal1H0(1:5) = mean(transpose(imageRefB1H0(74:78,51:60)));
RefVal2H0(1:5) = mean(transpose(imageRefB2H0(74:78,51:60)));
RefVal1H1(1:5) = mean(transpose(imageRefB1H1(74:78,51:60)));
RefVal2H1(1:5) = mean(transpose(imageRefB2H1(74:78,51:60)));

imageB1H0 = zeros(160,184);
imageB2H0 = zeros(160,184);
imageB1H1 = zeros(160,184);
imageB2H1 = zeros(160,184);

ImgSum0 = 0;
ImgSum1 = 0;

for ImInd = 1:NoFrames
    ImagenameB1=['Images_Analysis_Image' num2str(ImInd) '_B1.png'];
    ImagenameB2=['Images_Analysis_Image' num2str(ImInd) '_B2.png'];
    
    imageIntB1H0 = double(imread([FoldernameB1H0 '\' ImagenameB1]));
    imageIntB2H0 = double(imread([FoldernameB2H0 '\' ImagenameB2]));
    imageIntB1H1 = double(imread([FoldernameB1H1 '\' ImagenameB1]));
    imageIntB2H1 = double(imread([FoldernameB2H1 '\' ImagenameB2]));
    
    TestVal1H0(1:5) = mean(transpose(imageIntB1H0(74:78,51:60))) - RefVal1H0;
    TestVal2H0(1:5) = mean(transpose(imageIntB2H0(74:78,51:60))) - RefVal2H0;
    TestVal1H1(1:5) = mean(transpose(imageIntB1H1(74:78,51:60))) - RefVal1H1;
    TestVal2H1(1:5) = mean(transpose(imageIntB2H1(74:78,51:60))) - RefVal2H1;
    TestMat1H0 = imageIntB1H0(72:78,45:60) - imageRefB1H0(72:78,45:60);
    TestMat2H0 = imageIntB2H0(72:78,45:60) - imageRefB2H0(72:78,45:60);
    TestMat1H1 = imageIntB1H1(72:78,45:60) - imageRefB1H1(72:78,45:60);
    TestMat2H1 = imageIntB2H1(72:78,45:60) - imageRefB2H1(72:78,45:60);
    
    if (max(abs(TestVal1H0)) <= 3 && max(max(abs(TestMat1H0))) < 10)
        if (max(abs(TestVal2H0)) <= 3 && max(max(abs(TestMat2H0))) < 10)
            imageB1H0 = imageIntB1H0 + imageB1H0;
            imageB2H0 = imageIntB2H0 + imageB2H0;
            ImgSum0 = ImgSum0 + 1;
        end
    end
    if (max(abs(TestVal1H1)) <= 3 && max(max(abs(TestMat1H1))) < 10)
        if (max(abs(TestVal2H1)) <= 3 && max(max(abs(TestMat2H1))) < 10)
            imageB1H1 = imageIntB1H1 + imageB1H1;
            imageB2H1 = imageIntB2H1 + imageB2H1;
            ImgSum1 = ImgSum1 + 1;
        end
    end
end

imageB1H0 = 256*imageB1H0./ImgSum0;
imageB2H0 = 256*imageB2H0./ImgSum0;
imageB1H1 = 256*imageB1H1./ImgSum1;
imageB2H1 = 256*imageB2H1./ImgSum1;

imageB1H0 = uint16(imageB1H0);
imageB2H0 = uint16(imageB2H0);
imageB1H1 = uint16(imageB1H1);
imageB2H1 = uint16(imageB2H1);
% figure
% imshow(imageB1)
% figure
% imshow(imageB2)

imwrite(imageB1H0,[FoldernameB1H0 'Images_Analysis_Image_avg_B1.png'])
imwrite(imageB2H0,[FoldernameB2H0 'Images_Analysis_Image_avg_B2.png'])
imwrite(imageB1H1,[FoldernameB1H1 'Images_Analysis_Image_avg_B1.png'])
imwrite(imageB2H1,[FoldernameB2H1 'Images_Analysis_Image_avg_B2.png'])

end