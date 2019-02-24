threshold = 128;
I = imread('gray_image.jpg');

zI_horizontal = filtering(I, [-1,-2,-1;0,0,0;1,2,1]);
zI_vertical = filtering(I,  [-1,0,1;-2,0,2;-1,0,1]);

[rows, cols] = size(I);
zI = zeros(size(I));
for i=1:rows
    for j=1:cols
        p = sqrt( zI_vertical(i, j)^2 + zI_horizontal(i, j)^2 );
        if p > threshold
            zI(i,j) = p;
        end
    end
end
imwrite(uint8(zI), 'sobel.jpg');
imshow(uint8(zI));