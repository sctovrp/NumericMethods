clc	%permite borrar el area de trabajo
clear	%permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

fprintf('	FACTORIZACION LU CROULT\n\n\n');
%fprintf me permite ingresar comentarios de manera textual que pueden
%orientar al usuario en el uso del programa

%input es un comando de solicitud de entrada de datos del usuario.
A=input('Ingrese la matriz A = \n');
b=input('\nIngrese el vector b, correspondite a los terminos independientes b=\n');

size_of = size(A,1);
orden1=size(A); 
n=orden1(1,1); 
L=eye(size_of); 
%U = A;
U = zeros(size_of);

for j=1:size_of
    U(1,j)=A(1,j);
end
for i=2:size_of
    L(i,1)=A(i,1)/U(1,1);
end
for i=2:(size_of)
    for j=i:size_of
        sum=0;
        for k=1:(i-1)
            sum=sum+L(i,k)*U(k,j);
        end
        U(i,j)=A(i,j)-sum;
        clear sum;
    end
end
for j=2:(size_of) 
    for i=j+1:size_of
        sum=0;
        for k=1:(j-1)
            sum=sum+L(i,k)*U(k,j);
        end
        L(i,j)=(A(i,j)-sum)/U(j,j);
        clear sum
    end 
end
sum=0;
for k=1:(size_of-1)
    sum=sum+L(size_of,k)*U(k,size_of);
end
U(size_of,size_of)=A(size_of,size_of)-sum;

memoriaU=1; %calculo del determinante de u 
memoriaL=1; %calculo del determinante inicial de L 
for i=1:size_of
    memoriaL=memoriaL*L(i,i);
end
producto=memoriaL*memoriaU;	%calculo del determinante total
 
if producto~=0 
    for i=1:size_of
        suma=0;
        for p=1:i-1
            suma=suma+L(i,p)*z(p);
        end
    z(i)=(b(i)-suma)/L(i,i); %obtencion del vector Z
    end
    for i=size_of:-1:1
        suma=0;
        for p=(i+1):size_of
            suma = suma+U(i,p)*x(p);
        end
        x(i)=(z(i)-suma)/U(i,i); % solcion, calculos de las variables
    end
else
    fprintf('\nEl determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion\n')
end
  


fprintf('\n Matriz L:\n')
disp(L)
fprintf('\n Matriz U:\n') 
disp(U)
fprintf('\n El vector Z:\n') 
disp(z)
 
fprintf('\n\nLa solucion de X1 hasta Xn es:\n');
%a continuacion de utiliza una instruccion for, para mostrar el usuario,
%los resultados de una manera mas ordenada 
for i=1:size_of
    xi=x(1,i); 
    fprintf('\nX%g=',i) 
    disp(xi);
end






