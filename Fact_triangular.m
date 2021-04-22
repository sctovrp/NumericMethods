%Limpia pantalla y muestra nombre del método
clear
clc

disp(' MÉTODO FACTORIZACIÓN TRIANGULAR ');

%Se pide los datos
a = input('Ingrese el orden n de la matriz: ');
A = input('ingrese la matriz: ');
U = zeros(a,a);
L = zeros(a,a);
%A = [1 2 4 1;2 8 6 4;3 10 8 8;4 12 10 6];
%Y = [21 52 79 82];
%a = 4;
%L = zeros(4,4);
%U = zeros(4,4);
A
U=A;

%se Halla U con el metodo de gauss
m = a-1;
if (det(A)~= 0)
  for i = 1:m
    y = U(i,i);
    v1 = U(i,:);
    for j = i+1:a
      v2 = U(j,:);
      c = U(j,i)/y;
      L(j,i)=c;
      res = v2 - c*v1;
      U(j,:) = res;
    end
  end
  for i = 1:a
    L(i,i)=1;
  end
  L
  U
  aux = input('ingrese el vector B: ');
  sprintf('el valor de Y es: ');
  Y = sust(L,aux,a)
  sprintf('el valor de X es: ');
  X = susts(U,Y,a)
end



