function imgbHist = img2binary(img)
% Q2. Output the binary image
%% Use mean of each pixel thresholding
thrAve = mean(img, 'all');

%% Use histogram thresholding
histGray = [];
minIdx = min(img,[],'all') + 1;
maxIdx = max(img,[],'all') + 1;
medIdx = round((minIdx + maxIdx) / 2);
for i = minIdx:maxIdx
    histGray(i) = sum(img == i, 'all');
end
[~, leftIdx] = max(histGray(1:medIdx));
[~, rightIdx] = max(histGray((medIdx+1):maxIdx));
thrHist = leftIdx + rightIdx;
%% Use Otsu method
thrOtsu = graythresh(img) * 256;

%% Compare and plot
imgbAveg = img > thrAve;
imgbHist = img > thrHist;
imgbOtsu = img > thrOtsu;

figure(2);
subplot(131), imshow(imgbAveg, 'InitialMagnification', 'fit'), h1 = title(['Threshold = ', num2str(thrAve)]);
subplot(132), imshow(imgbHist, 'InitialMagnification', 'fit'), h2 = title(['Threshold = ', num2str(thrHist)]);
subplot(133), imshow(imgbOtsu, 'InitialMagnification', 'fit'), h3 = title(['Threshold = ', num2str(thrOtsu)]);
h0 = sgtitle('Binary Image using different thresholding methods');
set([h0, h1, h2, h3], 'Interpreter', 'latex');
