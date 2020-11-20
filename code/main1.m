clc; clear;
%% Encoder & preprocessing
FILEPATH = 'charact1.txt';
mode = 1;
fileID = fopen(FILEPATH);
char = fscanf(fileID, '%s', [64, 64]);
fclose(fileID);

% Dictionary-like char to number table using ASCII code
char2num = [zeros(1,'0'-1), 0:9, zeros(1,'A'-'9'-1), (0:('V'-'A')) + 10];
img = char2num(char');

%% Q1 Display
show_img(img);

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
