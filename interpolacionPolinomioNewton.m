%xi = [50 60 70 80 90 100]
%f[xi] = [24.94 30.11 36.05 42.84 50.57 59.30]
disp("Polinomio en diferencias de Newton");
n = input("Ingrese el grado del polinomio: ");
fprintf("Debe ingresar %.0f puntos\n",n+1);
X = input("ingrese el vector Xi: ");
disp(X); %muestra los datos ingresados xi
Y = input("Ingrese el vector F[Xi]: ");
disp(Y); %muestra los datos ingresados F[xi]
DD = zeros(n+1); % crea la matriz
aa = size(DD);
% agrega en la matriz los dos vectores
DD(:,1)= transpose(X); 
DD(:,2)= transpose(Y);
% Muestra el los datos de la matriz antes de empezar la interpolacion
disp("      xi     F[xi]     d[xi]     d^2F[xi]   d^3F[xi]  d^4F[xi]")
disp(DD);
nn = n;
for j = 3:n+1
    for i = nn:-1:1
        DD(i,j) = DD(i+1,j-1) - DD(i,j-1);i =
    end
    nn = nn - 1;
end %la matriz luego de la operacion
disp("      xi     F[xi]     dF[xi]    dF^2[xi]   dF^3[xi]  dF^4[xi]")
disp(DD);
a = input("Ingrese el valor a interpolar: "); %64
b = input("Ingrese el grado de interpolacion: "); %1
h = X(2)-X(1);
c = 0;
for k = 1: n %iteramos para tomer el xi mas cercano por debajo
    c = X(k);
    if c > a
        c = X(k-1);
        break;
    end
end  
s = (a - c) / h;
disp("h :");
disp(h); % imprime h
disp("s :");
disp(s); % imprime s
switch b %segun su grado, saldra su precision
    case 1
        p = DD(k-1,2) + s * DD (k-1,3);
    case 2
        p = DD(k-1,2) + s * DD (k-1,3) + ((s * s - 1)/ factorial(b) )* DD(k-1,4);
    case 3
        p = DD(k-1,2) + s * DD (k-1,3) + ((s * s - 1)/ factorial(b) )* DD(k-1,4) + ((s * (s - 1) * (s-2))/ factorial(b) )* DD(k-1,5);
    case 4
        p = DD(k-1,2) + s * DD (k-1,3) + ((s * s - 1)/ factorial(b) )* DD(k-1,4) + ((s * (s - 1) * (s-2))/ factorial(b) )* DD(k-1,5) + ((s * (s - 1) * (s-2) * (s-3))/ factorial(b) )* DD(k-1,6);
end
disp("s :");
disp(p);
plot(X,Y,'color','r'); xlabel("xi"); ylabel("F[xi]"); grid;
hold on



 
