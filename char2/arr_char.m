function imgScale = arr_char(img,border)
% Q8. Arrange the characters in one line with the sequence: 81344100ARHDFS
A_r = 0;
for k = 2:size(border, 2)
    A_r = max(A_r, border{k}(2)-border{k}(1)+1);  %qu zui da hang shu    
end
str= struct('a',{},'b',{});
for i = 1:size(border, 2)
    str(i).a = zeros(A_r, border{i}(4) - border{i}(3) + 1);
    str(i).a(1:border{i}(2) - border{i}(1)+1, 1:border{i}(4) - border{i}(3)+1)=...
    img(border{i}(1):border{i}(2), border{i}(3):border{i}(4));
end
imgScale=zeros(A_r, 1);
str(1).b=str(4).a;
str(2).b=str(6).a;
str(3).b=str(2).a;
str(4).b=str(8).a;
str(5).b=str(15).a;
str(6).b=str(9).a;
str(7).b=str(11).a;
str(8).b=str(12).a;
str(9).b=str(5).a;
str(10).b=str(3).a;
str(11).b=str(10).a;
str(12).b=str(14).a;
str(13).b=str(13).a;
str(14).b=str(7).a;
for i=1:size(str,2)
    imgScale = cat(2, imgScale, zeros(A_r,1), str(i).b);
end
imgScale = cat(2, imgScale, zeros(A_r,1));
figure();
imshow(imgScale, 'InitialMagnification', 'fit');
h1 = title('Arrange the character to: 81344100ARHDFS');
set(h1, 'Interpreter', 'latex');


    
