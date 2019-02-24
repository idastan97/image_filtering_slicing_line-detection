I = imread('gray_image.jpg');
zI = slice(I);

imshow(I);
title('original');

for k=1:8
    imwrite(zI(:,:,k), strcat('bit', num2str(k), '.tif'));
end

figure, imshow( [zI(:,:,1), zI(:,:,2), zI(:,:,3), zI(:,:,4), zI(:,:,5), zI(:,:,6), zI(:,:,7), zI(:,:,8)] );
title('slicing: least -> most significant');