clear all; close all;

Exp = 1;
NoPat = 100;
NoChange = 0;
PerChange = 20;
ImInd = 2;

imageB1 = zeros(160,184);
imageB2 = zeros(160,184);

FoldernameB1=['Images_White_Screen\White_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B1'];
FoldernameB2=['Images_White_Screen\White_Exp' num2str(Exp) '_NoPat' num2str(NoPat) '_' num2str(NoChange) '_' num2str(PerChange) '_B2'];

for ImInd = 2:201
    
    ImagenameB1=['Images_Analysis_Image' num2str(ImInd) '_B1.png'];
    ImagenameB2=['Images_Analysis_Image' num2str(ImInd) '_B2.png'];

    imageB1 = double(imread([FoldernameB1 '\' ImagenameB1])) + imageB1;
    imageB2 = double(imread([FoldernameB2 '\' ImagenameB2])) + imageB2;
end

imageB1 = imageB1./200;
imageB2 = imageB2./200;

imageB1 = uint8(imageB1);
imageB2 = uint8(imageB2);
imshow(imageB1)
figure
imshow(imageB2)

imwrite(imageB1,'Images_Analysis_Image_avg_B1.png')
imwrite(imageB1,'Images_Analysis_Image_avg_B2.png')