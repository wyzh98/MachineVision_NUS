clear;
%% Encoder
MODE = 1;
charpath = '.\assignment\charact1.txt';
fileID = fopen(charpath);
char = fscanf(fileID, '%s', [64, 64]);
fclose(fileID);

% Dictionary-like char to number table using ASCII code
char2num = [zeros(1,'0'-1), 0:9, zeros(1,'A'-'9'-1), (0:('V'-'A')) + 10];
img = char2num(char');

%% Solutions
% Q1: Display the original image on screen
imshow(img, [0, 31]); % Display the grayscale image that ranges [0, 31]
% Q2: Create a binary image using thresholding
imgBinary = img2binary(img, MODE);
figure();
imshow(imgBinary);