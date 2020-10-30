function show_img(img)
% Q1. Display the image on screen
figure();
imshow(img, [0 32], 'InitialMagnification', 'fit');
h1 = title('Original image');
set(h1, 'Interpreter', 'latex'); % Ignore this line in case you do not have latex env
