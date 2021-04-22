disp("Regla compuesta del trapecio");
fun = input("Ingrese la funcion: ",'s');% 2 + sin(2 * sqrt(x))
f = inline(fun);
disp(f);
dom = input("Ingrese el dominio: "); % x = [1 6]
disp(dom);
n_nodos = input("Ingrese el numero de nodos: "); % x = 11
disp(n_nodos);

% get m
if mod(n_nodos,2) == 0
    m = n_nodos / 2;
else
    m = (n_nodos - 1) / 2;
end
disp("m: ");
disp(m);

% get h 
h = (dom(2) - dom(1)) / (n_nodos - 1);
disp("h: ");
disp(h)

% let's create array of x_k
X = 1:zeros(n_nodos);
for i = 1: n_nodos - 2
    X(i) = dom(1) + i * h;
end

% put x inside given function
y = f(X);

% put all together
XX = 1:zeros(n_nodos);
YY = 1:zeros(n_nodos);
XX(1) = dom(1);
YY(1) = f(dom(1));
for i = 2: n_nodos-1
    XX(i) = X(i-1);
    YY(i) = y(i-1);
end
XX(n_nodos) = dom(2);
YY(n_nodos) = f(dom(2));
disp("X: ");
disp(XX);
disp("Y: ")
disp(YY);

% checking the constanst...
const1 = (1/3) * h;
const2 = (2/3) * h;
const3 = (4/3) * h;
disp("Primera constante: ");
disp(const1);
disp("Segunda constante: ");
disp(const2);
disp("Tercera constante: ");
disp(const3);

sBorders = 1:zeros(2);
sEvens = 1:zeros(m);
sOdds = 1:zeros(m);
for i = 1: n_nodos
    mm = mod(i,2);
    if i == 1 || i == n_nodos
        sBorders(end + 1) = YY(i);
        continue
    elseif  mm == 0
        sEvens(end + 1) = YY(i);
    elseif mm == 1
        sOdds(end + 1) = YY(i);
    end
end
disp("Terminos de la primera sumatoria: ");
disp(sBorders);
disp("Terminos de la segunda sumatoria: ");
disp(sOdds);
disp("Terminos de la tercera sumatoria: ");
disp(sEvens);
total = (const1 * sum(sBorders)) + (const2 * sum(sOdds)) + (const3 * sum(sEvens));
disp("Resultado total:   ");
disp(total);

% plot the given function
lin = linspace(dom(1), dom(2));
plot(lin,f(lin));grid; hold;
plot(XX,YY,'ro'); 




