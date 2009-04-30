function y = mesh1d(k,interval)

% Dado un vector de constantes de rigidez, devuelve las posiciones de
% los nodos en un dominio unidimensional.
% 
% Argumentos de entrada:
%
%  k: Constante de rigidez en cada nodo.  A mayor valor mayor
%     acercamiento con los puntos cercanos
%
%  interval: Intervalo que se quiere mallar
%
% Argumentos de salida:
%
%  y: Nodos dentro del intervalo


% Calcula el coeficiente k+
kp = k(2:end-1).*k(3:end)./(k(2:end-1)+k(3:end));
% Calcula el coeficiente k-
km = k(1:end-2).*k(2:end-1)./(k(1:end-2)+k(2:end-1));

% Matriz de la aplicacion lineal (densa)
A = - diag([0,kp],1) - diag([km,0],-1) + ...
    diag([1,+kp+km,1]);

b = zeros(size(k));
b(1) = interval(1);
b(end) = interval(2);

y = (A\b')';
