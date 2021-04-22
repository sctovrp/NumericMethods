%Se limpia la pantalla y se presenta el nombre del método
clear
clc
disp('Método de Bisección de Bolzano')
%Se solicita la información y valores del problema
l=3;
w=15000;
I=0.0003;
E=2e+11;
% Se solicita la entrada de la función de estudio
syms x
f(x)=(- ((w*l^4)/24) + ((l*w*l^3)/12) + 3*x)
%Se solicita el intervalo en el cual se estudiara la funcipon
d=0;
while(d==0)
    a=-100000;
    b=100000;
    %Se verifica el intervalo dado y se aprueba o no.
    if f(a)*f(b)<0
        d=1; 
    else
        if f(a)*f(b)>0
            display("no hay raiz")
        else  
            d=1;
        end
    end
end
%Definimos N como el contador del numero de iteraciones
N=0;
%Calculo de la raiz
while (abs(a-b)>0.001)
%Encontramos el valor medio del intervalo definido como c   
    c=(a+b)/2;
    f(c);
    N=N+1; 
%Se aplica el criterio que define el nuevo intervalo
    if (f(a)*f(c) > 0)
        a=c; 
    else 
      b=c;
    end
end
%Se presenta la respuesta aproximada<
disp("La raiz es aproximadamente:")
C_1=c
