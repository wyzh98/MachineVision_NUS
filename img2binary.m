function imgbHist = img2binary(img)
%% Use mean of each pixel thresholding
thrAve = mean(img, 'all');

%% Use histogram thresholding
histGray = [];
minIdx = min(img,[],'all') + 1;
maxIdx = max(img,[],'all') + 1;
medIdx = round((minIdx + maxIdx) / 2);
for i = minIdx:maxIdx
    A(i) = sum(img == i, 'all');
end
[~, leftIdx] = max(A(1:medIdx));
[~, rightIdx] = max(A((medIdx+1):maxIdx));
thrHist = leftIdx + rightIdx;
%% Use Otsu method
thrOtsu = graythresh(img) * 256;
%% Compare and plot
imgbAveg = img > thrAve;
imgbHist = img > thrHist;
imgbOtsu = img > thrOtsu;

figure();
subplot(1,3,1), imshow(imgbAveg), h1 = title(['Threshold = ', num2str(thrAve)]);
subplot(1,3,2), imshow(imgbHist), h2 = title(['Threshold = ', num2str(thrHist)]);
subplot(1,3,3), imshow(imgbHist), h3 = title(['Threshold = ', num2str(thrOtsu)]);
h0 = sgtitle('Binary Image using different thresholding methods');
set([h0, h1, h2, h3], 'Interpreter', 'latex');
