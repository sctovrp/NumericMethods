clear
clc
disp('Metodo de Newton Raphson')
syms x
f=input ('introduzca la función f(x):');
% f es la función que se introduciará como una cadena de caracteres 'f'
Pi=input ('introduzca el punto Xi:');
% es el punto de inico
err=input('porcentaje de tolerancia:');
% se introduce el error o la tolerancia para Pi
fplot(f)
grid on 
% graficamos la función y que en esta aparezca la cuadricula 
d=diff(f);
% definimos la derivada de la función 
d=inline(d);
f=inline(f);
% para evaluar las funciones de una forma correcta 
ea=100;
% definimos el error absoluto maximo para relacionarlo con err
j=0;
%este será el contador que ira aumentando 1 en 1 con el numero de
%iteraciones 
while ea>err
    xi=pi-(f(pi)/d(pi));
    %definimos la ecuación del metodo
    ea=abs(((xi-pi)/xi)*100);
    %definimos el error absoluto 
    pi=xi;
    y=f(pi);
    j=j+1;
    % este me llevara el conteo de las iteraciones que esta hacienod el
    % programa 
    fprintf('%d\t %f\t %f\t %f\n',j,xi,y,err)
% para mostrar los resultados en pantalla
end

% tan(x) -0.3
% sqrt(5x) 9

