clc; clear;
%% Encoder & preprocessing
FIGPATH  = 'charact2.jpg';
img = imread(FIGPATH);
img = rot90(img, 2); % Rotate the image by 180 degrees (can be realized manually)

%% Q1 display
show_img(img);
img = rgb2gray(img);

%% Q2 Binarization
imgBinary = img2binary(img);

%% Q3 Segmentation
border = segment(imgBinary);

%% Q4/5 Rotation
imgRot90 = rotate(imgBinary, border, 90);

imgRot35 = rotate(imgBinary, border, 90-35);

imgInter = near_point_inter(imgRot35);

%% Q6 Outline
imgOutline = extract_outline(imgBinary);

%% Q7 Thinning
imgThin = thinning(imgBinary);

%% Q8 Arrangement
imgArr = arr_char(imgBinary,border);