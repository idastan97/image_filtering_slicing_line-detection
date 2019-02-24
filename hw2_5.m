threshold = 128;
mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
I = imread('gray_image.jpg');

zI = filtering(I, mask);
[rows, cols] = size(I);
for i=1:rows
    for j=1:cols
        if zI(i, j) < 0
            zI(i, j) = -zI(i, j);
        end
        if zI(i, j) < threshold
            zI(i, j) = 0;
        end
    end
end
imwrite(uint8(zI), 'laplacian.jpg');
imshow(uint8(zI));