clear;
%% Encoder & preprocessing
MODE = 2;
FIGPATH  = '.\assignment\charact2.jpg';
img = imread(FIGPATH);
img = rot90(img, 2); % Rotate the image by 180 degrees (can be realized manually)

%% Solutions
% Q1: Display the original image on screen
show_img(img, MODE);
img = rgb2gray(img);

% Q2: Create a binary image using thresholding
imgBinary = img2binary(img);