function img = near_point_inter(img)
% Interpolate to fill the hole
[m, n] = size(img);
for i = 2:m-1
    for j = 2:n-1
        if img(i, j) == 0 && img(i-1, j) > 0 && img(i, j-1) > 0 && img(i, j+1) > 0 && img(i+1, j) > 0
             img(i, j) = 1;
        end
    end
end
figure();
imshow(img, 'InitialMagnification', 'fit');
h1 = title('Rotation after interpolation');
set(h1, 'Interpreter', 'latex');

             