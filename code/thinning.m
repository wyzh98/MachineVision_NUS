function imgThin = thinning(img)
% Q7. Determine a one-pixel thin image of the characters
int = 1;
[row, col] = size(img);
imgThin = img;
thin_del = ones(row, col);
while int
    int = 0;
    for i = 2:row-1
        for j = 2:col-1
            x = [imgThin(i,j) imgThin(i-1,j) imgThin(i-1,j+1) imgThin(i,j+1) imgThin(i+1,j+1) ...
                imgThin(i+1,j) imgThin(i+1,j-1) imgThin(i,j-1) imgThin(i-1,j-1) imgThin(i-1,j)];
            if (imgThin(i,j) == 1 && sum(x(2:end-1)) <= 6 && sum(x(2:end-1)) >= 2 && ...
                                       x(2)*x(4)*x(6) == 0 && x(4)*x(6)*x(8) == 0)
                A = 0;
                for k = 2:size(x, 2)-1
                    if x(k) == 0 && x(k+1) == 1
                        A = A+1;
                    end
                end
                if (A == 1)
                    thin_del(i, j)=0;
                    int = 1;
                end
            end
        end
    end
    imgThin = imgThin .* thin_del;
    for i = 2:row-1
        for j = 2:col-1
            x = [imgThin(i,j) imgThin(i-1,j) imgThin(i-1,j+1) imgThin(i,j+1) imgThin(i+1,j+1) ...
                imgThin(i+1,j) imgThin(i+1,j-1) imgThin(i,j-1) imgThin(i-1,j-1) imgThin(i-1,j)];
            if (imgThin(i,j) == 1 && sum(x(2:end-1)) <= 6 && sum(x(2:end-1)) >= 2 && ...
                                       x(2)*x(4)*x(8) == 0 && x(2)*x(6)*x(8) == 0)
                A = 0;
                for k = 2:size(x, 2)-1
                    if x(k) == 0 && x(k+1) == 1
                        A = A+1;
                    end
                end
                if (A == 1)
                    thin_del(i, j) = 0;
                    int = 1;
                end
            end
        end
    end
    imgThin = imgThin .* thin_del;
end
figure();
imshow(imgThin, 'InitialMagnification', 'fit');
h1 = title('Thinning');
set(h1, 'Interpreter', 'latex');
