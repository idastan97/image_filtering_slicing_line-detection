function arr = getBits(num)
arr = [0, 0, 0, 0, 0, 0, 0, 0];
for i=1:8
    arr(i) = mod(num,2);
    num = floor(num/2);
end