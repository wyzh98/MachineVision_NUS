function imgScale = arr_char(img, border, mode)
% Q8. Arrange the characters in one line with the sequence
height = 0;
for k = 2: size(border, 2)
    height = max(height, border{k}(2)-border{k}(1)+1);
end
char = struct('a',{},'b',{});
for i = 1: size(border, 2)
    char(i).a = zeros(height, border{i}(4) - border{i}(3) + 1);
    char(i).a(1:border{i}(2) - border{i}(1) + 1, 1:border{i}(4) - border{i}(3) + 1) = ...
                        img(border{i}(1):border{i}(2), border{i}(3):border{i}(4));
end
imgScale = zeros(height, 1);
if mode == 1
    char(1).b = char(4).a;
    char(2).b = char(1).a;
    char(3).b = char(5).a;
    char(4).b = char(2).a;
    char(5).b = char(6).a;
    char(6).b = char(3).a;
elseif mode == 2
    char(1).b=char(4).a;
    char(2).b=char(6).a;
    char(3).b=char(2).a;
    char(4).b=char(8).a;
    char(5).b=char(15).a;
    char(6).b=char(9).a;
    char(7).b=char(11).a;
    char(8).b=char(12).a;
    char(9).b=char(5).a;
    char(10).b=char(3).a;
    char(11).b=char(10).a;
    char(12).b=char(14).a;
    char(13).b=char(13).a;
    char(14).b=char(7).a;
end
for i=1:size(char, 2)
    imgScale = cat(2, imgScale, zeros(height, 1), char(i).b);
end
imgScale = cat(2, imgScale, zeros(height,1));
figure();
imshow(imgScale, 'InitialMagnification', 'fit');
h1 = title('Rearrange the character');
set(h1, 'Interpreter', 'latex');
