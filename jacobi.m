%Jacobi

%A: [4 -1 1; 4 -8 1; -2 1 5]
%b: [7 -21 15]


% La notacion usada es: Ax = b
A = input('A: ');
b = input('b: ');
error = input('error: ');

% Creamos un vector sobre el cual operar
n = size(A,1);
%X0 = zeros(1,n);
X0 = [1 2 2];
X = X0;

% Condicion para finalizar el ciclo
tolerancia = 1;
fprintf('%9s %9s %9s %9s\n','x1','x2','x3','error');

%inicia la iteracion
while tolerancia > error
    for i = 1:n
        %sumatoria de nueva linea
		sumatoria_interna = 0;
		for j = 1:n
			if i ~= j
                % corazon de la suma
				sumatoria_interna = sumatoria_interna + A(i,j) * X0(j);
			end
		end
		X(i) = (b(i) - sumatoria_interna) / A(i,i);
        % impresion de resultados
		fprintf('%10.6f', X(i));
    end
    % Convergencia para esta aproximacion
	tolerancia = norm(X0 - X);
    X0 = X;
    % impresion del error
	fprintf('%10.6f\n', tolerancia);
end
% fin de la iteracion