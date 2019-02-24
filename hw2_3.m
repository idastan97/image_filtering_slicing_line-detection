mask = [1 1 1; 1 -8 1; 1 1 1];
I = imread('gray_image.jpg');

zI = filtering(I, mask);
imwrite(uint8(zI), 'filtered.jpg');
imshow(uint8(zI));