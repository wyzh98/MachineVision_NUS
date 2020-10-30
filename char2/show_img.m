function show_img(img)
% Q1. Display the image on screen
imshow(img, 'InitialMagnification', 'fit');
figure(1);
h1 = title('Original image');
set(h1, 'Interpreter', 'latex'); % Ignore this line in case you do not have latex env
