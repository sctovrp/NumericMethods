function P = pasc(n,m)
% Datos - n cantidad filas
%       - m numero primo
% Resultado - P triango de Pascal

for j = 1:n
    P(j,1) = 1;
    P(1,j) = 1;
end
for k = 2: n
    for j = 2 :n
        P(k,j)= rem(P(k,j-1), m) + rem(P(k-1,j), m);
    end
end
    