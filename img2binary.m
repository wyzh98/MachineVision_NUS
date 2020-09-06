function binaryImg = img2binary(img, mode)
if mode == 1
    threshold = 0;
    binaryImg = img > threshold;
elseif mode == 2
    threshold = 70;
    binaryImg = img > threshold;
end
end