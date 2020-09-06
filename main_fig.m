clear;
%% Encoder & preprocessing
MODE = 2;
figpath  = '.\assignment\charact2.jpg';
img = imread(figpath);
img = rot90(img, 2); % Rotate the image by 180 degrees (can be realized manually)

%% Solutions
% Q1: Display the original image on screen
imshow(img);
img = rgb2gray(img);
% Q2: Create a binary image using thresholding
imgBinary = img2binary(img, MODE);
figure();
imshow(imgBinary);