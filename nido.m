for i = 1: 5
    A(i,1) = 1; A(1,i) = 1;
end
for i = 2: 5
    for j = 2: 5
        A(i,j) = A (i, j - 1) + A(i - 1, j);
    end
end
A
