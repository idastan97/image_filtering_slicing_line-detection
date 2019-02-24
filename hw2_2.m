I = imread('gray_image.jpg');
zI = slice(I);

zI_2bits = zI(:,:,7)*(2^6) + zI(:,:,8)*(2^7);
zI_3bits = zI(:,:,6)*(2^5) + zI_2bits;
imwrite(uint8(zI_2bits), 'most2bits.jpg');
imwrite(uint8(zI_3bits), 'most3bits.jpg');
imshow(I);
title('original');
figure, imshow(uint8(zI_3bits));
title('most 3 bits');
figure, imshow(uint8(zI_2bits));
title('most 2 bits');