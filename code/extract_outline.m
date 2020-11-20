function imgOutline = extract_outline(img)  
% Q6. Determine the outline(s) of characters of the image
[row, col]=size(img);
imgOutline = zeros(row, col);
for i = 2:row-1
    for j = 2:col-1
        if img(i,j) == 1 && imgOutline(i,j) == 0
            if img(i, j) == 1 && img(i-1, j) > 0 && img(i, j-1) > 0 && img(i, j+1) > 0 && img(i+1, j) > 0
                imgOutline(i,j) = 0;
            else
                imgOutline(i, j) = 1;
            end
        end
    end
end
figure();
imshow(imgOutline, 'InitialMagnification', 'fit');
h1 = title('Outline');
set(h1, 'Interpreter', 'latex');
