clear;
%% Encoder
MODE = 1;
CHARPATH = '.\assignment\charact1.txt';
fileID = fopen(CHARPATH);
char = fscanf(fileID, '%s', [64, 64]);
fclose(fileID);

% Dictionary-like char to number table using ASCII code
char2num = [zeros(1,'0'-1), 0:9, zeros(1,'A'-'9'-1), (0:('V'-'A')) + 10];
img = char2num(char');

%% Solutions
% Q1: Display the original image on screen
show_img(img, MODE);

% Q2: Create a binary image using thresholding
img2binary(img);


