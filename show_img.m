function img = show_img(img, MODE)
if MODE == 1
    imshow(img, [0, 31]); % Display the grayscale image that ranges [0, 31]
elseif MODE == 2
    imshow(img);
end
h1 = title('Original image');
set(h1, 'Interpreter', 'latex'); % Ignore this line in case you do not have latex env
