function [ imageB1, imageB2, ImgSum ] = ImageAvg( Exp, NoPat, NoChange, PerChange, NoFrames )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

FoldernameB1=['DataCollect\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B1'];
FoldernameB2=['DataCollect\Images_Analysis_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B2'];
ImagenameB1=['Images_Analysis_Image1_B1.png'];
ImagenameB2=['Images_Analysis_Image1_B2.png'];

imageB1 = zeros(160,184);
imageB2 = zeros(160,184);

imageRefB1 = double(imread([FoldernameB1 '\' ImagenameB1]));
imageRefB2 = double(imread([FoldernameB2 '\' ImagenameB2]));

ImgSum = 0;

for ImInd = 2:NoFrames
    ImagenameB1=['Images_Analysis_Image' num2str(ImInd) '_B1.png'];
    ImagenameB2=['Images_Analysis_Image' num2str(ImInd) '_B2.png'];
    
    imageIntB1 = double(imread([FoldernameB1 '\' ImagenameB1]));
    imageIntB2 = double(imread([FoldernameB2 '\' ImagenameB2]));
    
    TestMat1 = imageIntB1(50:78,30:60) - imageRefB1(50:78,30:60);
    TestMat2 = imageIntB2(50:78,30:60) - imageRefB2(50:78,30:60);
    
    if max(max(abs(TestMat1))) < 20
        if max(max(abs(TestMat2))) < 20
            imageB1 = imageIntB1 + imageB1;
            imageB2 = imageIntB2 + imageB2;
            ImgSum = ImgSum + 1;
        end
    end
end

imageRefB1 = imageB1/ImgSum;
imageRefB2 = imageB2/ImgSum;

RefVal1(1:5) = mean(transpose(imageRefB1(74:78,51:60)));
RefVal2(1:5) = mean(transpose(imageRefB2(74:78,51:60)));

imageB1 = zeros(160,184);
imageB2 = zeros(160,184);

ImgSum = 0;

for ImInd = 1:NoFrames
    ImagenameB1=['Images_Analysis_Image' num2str(ImInd) '_B1.png'];
    ImagenameB2=['Images_Analysis_Image' num2str(ImInd) '_B2.png'];
    
    imageIntB1 = double(imread([FoldernameB1 '\' ImagenameB1]));
    imageIntB2 = double(imread([FoldernameB2 '\' ImagenameB2]));
    
    TestVal1(1:5) = mean(transpose(imageIntB1(74:78,51:60))) - RefVal1;
    TestVal2(1:5) = mean(transpose(imageIntB2(74:78,51:60))) - RefVal2;
    TestMat1 = imageIntB1(72:78,45:60) - imageRefB1(72:78,45:60);
    TestMat2 = imageIntB2(72:78,45:60) - imageRefB2(72:78,45:60);
    
    if (max(abs(TestVal1)) <= 3 && max(max(abs(TestMat1))) < 10)
        if (max(abs(TestVal2)) <= 3 && max(max(abs(TestMat2))) < 10)
            imageB1 = imageIntB1 + imageB1;
            imageB2 = imageIntB2 + imageB2;
            ImgSum = ImgSum + 1;
        end
    end
end

imageB1 = 256*imageB1./ImgSum;
imageB2 = 256*imageB2./ImgSum;

imageB1 = uint16(imageB1);
imageB2 = uint16(imageB2);
% figure
% imshow(imageB1)
% figure
% imshow(imageB2)

imwrite(imageB1,[FoldernameB1 'Images_Analysis_Image_avg_B1.png'])
imwrite(imageB2,[FoldernameB2 'Images_Analysis_Image_avg_B2.png'])

end

