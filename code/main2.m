clc; clear;
%% Encoder & preprocessing
FILEPATH  = 'charact2.jpg';
mode = 2;
img = imread(FILEPATH);
rgbhist(img);
%% Q1 display
img = im2double(img);
img = rotate(img, {[1,size(img,1),1,size(img,2)]}, 180);
img = rgb2gray(im2uint8(img));

%% Q2 Binarization
imgBinary = img2binary(img, mode);

%% Q3 Segmentation
border = segment(imgBinary, mode);

%% Q4/5 Rotation
imgRot90 = rotate(imgBinary, border, 90);

imgRot35 = rotate(imgBinary, border, 90-35);

imgInter = near_point_inter(imgRot35);

%% Q6 Outline
imgOutline = extract_outline(imgBinary);

%% Q7 Thinning
imgThin = thinning(imgBinary);

%% Q8 Arrangement
imgArr = arr_char(imgBinary, border, mode);
