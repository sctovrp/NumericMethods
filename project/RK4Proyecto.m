
clc
clear all
disp=("Ecuaciones Diferenciales, disparo lineal por el metodo Runge Kutta N4")
%Se ingresa la información del problema
E=2e+11;
I=0.0003;
W=15000;
l=3;
%Se ingresa el interbalo [a-b]
%a=input("Ingrese extremo inferior del intervalo: ")
a=0;
%b=input("Ingrese extremo superior del intervalo: ")
b=3;
t0=a;
tf=b;
%Se establece el paso de los intervalos
h=0.5;
%h=input("Ingrese paso entre intervalos h: ")
%Se establecen los valores iniciales
%alpha=input("Ingrese valor inicial alpha: ")
alpha=0;
%Beta=input("Ingrese valor inicial Beta: ")
Beta=0;
t_0=a;
t_f=b;
%Se establecen las variables como simbolicas
syms x y xi yi t z  X W
%Ecuacion diferencial de U
%Funciones para U
%Funcion f
%f=input("Ingrese función f: ")
f(t)=y;
%Función g
g(t)=(-0.000125*t^(2))+(0.000375*t);
%g=input("Ingrese la función g: ")
d=(b-a)/h;
%Se crea la matriz donde se almacenaran los valores
r=zeros(d,1);
t=t_0;  
x=alpha;
y=0;
for i=1:1:d
    
    x_0=x;
    y_0=y;
    t_0=t;
    
    r(i,1)=x;
    
   %Para K1 Y L1 
   
    k1=eval(f);
    L1=eval(g);
    
   %Para K2 Y L2
   
    k2=[t_0+(h/2),x_0+(h/2)*k1,y_0+(h/2)*L1];
    t=k2(1);
    x=k2(2);
    y=k2(3);
    k2=eval(f);
    L2=[t_0+(h/2),x_0+(h/2)*k1,y_0+(h/2)*L1];
    L2=eval(g);
    
   %Para K3 Y L3 
   
    k3=[t_0+(h/2),x_0+((h/2)*k2),y_0+(h/2)*L2];
    t=k3(1);
    x=k3(2);
    y=k3(3);
    k3=eval(f);
    L3=[t_0+(h/2),x_0+(h/2)*k2,y_0+(h/2)*L2];
    L3=eval(g);
    
   %Para K4 Y L4 
   
    k4=[t_0+(h),x_0+(h)*k3,y_0+h*(L3)];
    t=k4(1);
    x=k4(2);
    y=k4(3);
    k4=eval(f);
    L4=[t_0+(h),x_0+(h)*k3,y_0+h*(L3)];
    L4=eval(g);
    
    %Luego
    
    x=x_0+(h/6)*(k1+2*k2+2*k3+k4);
    y=y_0+(h/6)*(L1+2*L2+2*L3+L4);
    t=t_0+h;
    o=0+i;
end
x;
U=x;
r(d+1)=x;
tt_0=a;
t_f=b;
%Establecemos las variables como simbolicas
syms xx yy xxi yyi tt zz   
%Ecuación diferencial de V
%Funciones para V
%Funcion f
%ff=input("Ingrese función ff: ")
ff(tt)=yy;
%Función g
%gg=input("Ingrese función gg: ")
gg(tt)=(-0.000125*tt^(2))+(0.000375*tt);
d=(b-a)/h;
%Se inicia la matriz rr en la que se almacenara los resultados de x
rr=zeros(d,1);
tt=tt_0;    
xx=0;
yy=1;
for i=1:1:d
    
    xx_0=xx;
    yy_0=yy;
    tt_0=tt;
    
   rr(i,1)=xx;
    
   %Para K1 Y L1 
   
    k1=eval(ff);
    L1=eval(gg);
    
   %Para K2 Y L2
   
    k2=[tt_0+(h/2),xx_0+(h/2)*k1,yy_0+(h/2)*L1];
    tt=k2(1);
    xx=k2(2);
    yy=k2(3);
    k2=eval(ff);
    L2=[tt_0+(h/2),xx_0+(h/2)*k1,yy_0+(h/2)*L1];
    L2=eval(gg);
    
   %Para K3 Y L3 
   
    k3=[tt_0+(h/2),xx_0+((h/2)*k2),yy_0+(h/2)*L2];
    tt=k3(1);
    xx=k3(2);
    yy=k3(3);
    k3=eval(ff);
    L3=[tt_0+(h/2),xx_0+(h/2)*k2,yy_0+(h/2)*L2];
    L3=eval(gg);
    
   %Para K4 Y L4 
   
    k4=[tt_0+(h),xx_0+(h)*k3,yy_0+h*(L3)];
    tt=k4(1);
    xx=k4(2);
    yy=k4(3);
    k4=eval(ff);
    L4=[tt_0+(h),xx_0+(h)*k3,yy_0+h*(L3)];
    L4=eval(gg);
    
    %Luego
    
    xx=xx_0+(h/6)*(k1+2*k2+2*k3+k4);
    yy=yy_0+(h/6)*(L1+2*L2+2*L3+L4);
    tt=tt_0+h;
    o=0+i;
end
xx;
rr;
rr(d+1)=xx;
r_l=length(r);
rr_l=length(rr);
syms t I
%Se calcula el valor W
W=(Beta-U)/xx;
%Cálculo de solución por el metodo RK4 x(t)
II=r(1)+((Beta-U)/xx)*rr(1);
for c=2:1:d+1
I=r(c)+((Beta-U)/xx)*rr(c);
II=[II;I];
end 
II;
length(II);
format long
z=[a:h:b];
zz=transpose(z);
%Realizamos la tabla solicitada
Disp=("       X               Solución ")
[zz II]
