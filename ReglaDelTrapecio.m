clear
clc
%Presentamos el metodo a utilizar
disp('Regla compuesta del trapecio')
%Se solicita la funcion a integrar
%Función del ejmplo: inline("2+sin(2*sqrt(x))","x")
f=input("Inserte función de x de la forma inline: ")
%Se solicita el intervalo en el cual se desea integrar
I=input("Inserte intervalo ")
U=length(I);
%Se establecen las variables a y b a partir del intervalo ingresado
a=I(1);
b=I(U);
x=0:0.02:b;
F=f(x);
%Se solicita el numero de nodos que desea
N=input("Inserte numero de nodos (subdivisones) que desea ")
%Se establecen las variables M, h y los puntos x , y necesarios para
%construir la función
M=N-1;
h=(b-a)/M;
X=0:h:b+h;
y=(f(X));
%Se lleva a cabo la iteracion para encontrar los valores k_x en forma de
%vector
for k=1:(M-1);
X_k=a+(h*k);
K(k)=f(X_k);
end
K;
%Se lleva a cabo la sumatoria de los valores X_k evaluados en la funcion
S=sum(K);
format long
%Se construye la formula que aproximara la integral
T=h/2*(f(a)+f(b))+h*S
%Se procede a gráficar
%Primero graficamos la curva que establece la función inicial
plot(x,f(x),"color",[0.9290 0.6940 0.1250],'LineWidth',2)
hold on
stem(X,y,"color","g",'LineWidth',1)
hold on
%Se grafican los trapecios formados por el metodo
plot(X,y,"-o"), set(gca,'XLim',[0 6],'YLim',[0 4]), line(0.5,3)
%Se colorea el area bajo la curva de los trapecios
area(X,y,'FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',.3,'EdgeAlpha',.3)
hold on 
title('Area bajo la curva por metodo del Trapecio'),xlabel('X'),ylabel('Y') 


