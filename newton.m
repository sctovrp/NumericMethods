function [xn, error, n] = Metodo_Newton(x0, tol, max, f, f_prima)

n = 0;
error = tol + 1;
x1 = x0;
while n < max && error > tol
    x2 = x1 - f(x1) / (f_prima(x1));
    error = x2 - x1; 
    x1 = x2;
    n= n+1;
end
xn = x2;
end