function imgRotate = rotate(img, border, degree)
% Q4/5. Rotate each character to some degree
[row, col, dep] = size(img);                                                      
imgRotate = zeros(row, col, dep);
for k = 1:size(border, 2)
    for i = border{k}(3):border{k}(4)
        for j = border{k}(1):border{k}(2)
            M1 = [1 0 0; 0 -1 0; -0.5*(border{k}(3)+border{k}(4)) 0.5*(border{k}(1)+border{k}(2)) 1];
            M2 = [cosd(degree) -sind(degree) 0; sind(degree) cosd(degree) 0; 0 0 1];
            M3 = [1 0 0; 0 -1 0; 0.5*(border{k}(3)+border{k}(4)) 0.5*(border{k}(1)+border{k}(2)) 1];
            temp = [i j 1] * M1 * M2 * M3;
            y = temp(1, 2);
            x = temp(1, 1);
            y = round(y);
            x = round(x);                                               
            if(x >= 1 && x <= col) && (y >= 1 && y <= row)                               
               imgRotate(y, x, :) = img(j, i, :);
            end
        end
    end
end
figure();
imshow(imgRotate, 'InitialMagnification', 'fit')    
h1 = title('Rotation');
set(h1, 'Interpreter', 'latex');
