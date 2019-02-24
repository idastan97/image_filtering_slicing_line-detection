function zI=slice(I)
[rows, cols] = size(I);
zI = zeros(rows, cols, 8);

for i=1:rows
    for j=1:cols
        arr = getBits(I(i, j));
        for k=1:8
            zI(i, j, k) = arr(k);
        end
    end
end
