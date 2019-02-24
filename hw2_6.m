threshold = 128;
n = 20;
scaleO = 25;
scaleq = 0.25;

I = imread('gray_image.jpg');

zI_x = filtering(I, [-1,-2,-1;0,0,0;1,2,1]);
zI_y = filtering(I,  [-1,0,1;-2,0,2;-1,0,1]);

[rows, cols] = size(I);
shift = 1;
sizeO = ceil(2*pi*scaleO) + shift;
sizeq = ceil(sqrt(rows^2 + cols^2)*scaleq) + shift;
H = zeros( sizeO, sizeq);
for i=1:rows
    for j=1:cols
        p = sqrt( zI_x(i, j)^2 + zI_y(i, j)^2 );
        if p > threshold
            O = atan( zI_y(i, j) / zI_x(i, j) );
            if O < 0
                O = O + (2*pi);
            end
            q = i*cos(O) + j*sin(O);
            if q<0
                q = -q;
                O = O-pi;
            end
            H(round(O*scaleO) + shift, round(q*scaleq) + shift) = H(round(O*scaleO) + shift, round(q*scaleq) + shift) + 1;
        end
    end
end
flat_votes = zeros(sizeO*sizeq, 3);

for i=1:sizeO
    for j=1:sizeq
        flat_votes( sizeq*(i-1) + j, 1) = H(i,j);
        flat_votes( sizeq*(i-1) + j, 2) = (i-shift)/scaleO;
        flat_votes( sizeq*(i-1) + j, 3) = (j-shift)/scaleq;
    end
end

sorted_votes = sortrows(flat_votes, 'descend');

lines = zeros(n, 2);

for i=1:n
%     disp([ 'O=', num2str(sorted_votes(i,2)), ' q=', num2str(sorted_votes(i,3)), ' votes=', num2str(sorted_votes(i,1)) ]);
    lines(i, 1) = sorted_votes(i,2);
    lines(i, 2) = sorted_votes(i,3);
end
% imshow(uint8(H));

min_votes = sorted_votes(n,1);

zI = zeros(size(I));
for i=1:rows
    for j=1:cols
        O = j/i;
        q = i*cos(O) + j*sin(O);
        for k=1:n
            q = i*cos(lines(k,1)) + j*sin(lines(k,1));
            if abs(q-lines(k,2)) < 1
                zI(i,j) = 255;
            end
        end
    end
end

rgbImage = cat(3, uint8(I+uint8(zI)), uint8(I), uint8(I));

imwrite(rgbImage, 'lines.jpg');
imshow(rgbImage);