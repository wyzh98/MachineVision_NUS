clc;
clear;
A = [ 1 0 0 0 0 0 0 1
    0 8 8 9 9 9 8 0
    0 0 8 9 9 8 0 1
    0 0 0 9 9 0 0 0
    0 1 0 9 9 0 1 0
    0 0 0 8 8 0 0 0
    1 0 1 7 7 0 1 0
    0 0 0 5 5 0 0 1];
[M, N] = size(A);
B = 16 .* A;
C = uint8(B);
D = im2double(C);
max_pixel = 0;
min_pixel = 1;
for i=1:M
    for j=1:N
        if D(i,j)>max_pixel
            max_pixel = D(i,j);
        end
    end
end
for i=1:M
    for j=1:N
        if D(i,j)<min_pixel
            min_pixel = D(i,j);
        end
    end
end
P = 1/(max_pixel-min_pixel) .* D ;
figure();
subplot(221);
imshow(P,'InitialMagnification','fit');
subplot(222);
imshow(D,'InitialMagnification','fit');
subplot(223);imhist(P);
subplot(224);imhist(D);


            