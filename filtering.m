function zI=filtering(I, mask)
[n, m] = size(mask);
cx = ceil(n/2);
cy = ceil(m/2);
[rows, cols] = size(I);
zI = zeros(size(I));
I = [zeros(cx-1, cols+2*cy-2); [zeros( rows,cy-1), I, zeros(rows, cy-1)]; zeros(cx-1, cols+2*cy-2)];

for i=1:rows
    for j=1:cols
        vals = double(mask).*double(I(i:(i+2*cx-2), j:(j+2*cy-2)));
        zI(i, j) = sum(vals(:));
    end
end