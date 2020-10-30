function imgScale = arr_char(B,border)
% Q8. Arrange the characters in one line with the sequence: A1B2C3
b = size(border, 2);
A_r = 0;
for k = 1:b
    A_r = max(A_r, border{k}(2) - border{k}(1) + 1);   
end
str= struct('a',{},'b',{});
for i = 1:b
    str(i).a = zeros(A_r, border{i}(4) - border{i}(3) + 1);
    str(i).a(1:border{i}(2)-border{i}(1)+1, 1:border{i}(4)-border{i}(3)+1) =...
                    B(border{i}(1):border{i}(2), border{i}(3):border{i}(4));
end
imgScale = zeros(A_r, 1);
str(1).b = str(4).a;
str(2).b = str(1).a;
str(3).b = str(5).a;
str(4).b = str(2).a;
str(5).b = str(6).a;
str(6).b = str(3).a;
for i = 1:size(str,2)
	imgScale = cat(2, imgScale, zeros(A_r, 1), str(i).b);
end
imgScale = cat(2,imgScale,zeros(A_r,1));
figure();
imshow(imgScale, 'InitialMagnification', 'fit');
h1 = title('Arrange the character to: A1B2C3');
set(h1, 'Interpreter', 'latex');
