function rgbhist(img)
img1 = img(:,:,1);
img2 = img(:,:,2);
img3 = img(:,:,3);
figure();
subplot(1, 2, 1);
bar(imhist(img1), 'r');
hold on;
bar(imhist(img2), 'g');
hold on;
bar(imhist(img3), 'b');
alpha(0.3);
xlabel('Intensity');
ylabel('Number of pixels');
legend('R','G','B');

img = rgb2gray(img);
subplot(1, 2, 2);
bar(imhist(img), 'k');
xlabel('Intensity');
ylabel('Number of pixels');
legend('Grayscale');
h0 = sgtitle('RGB and greyscale channels');
set(h0, 'Interpreter', 'latex');


