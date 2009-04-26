function y = mesh1d(k,interval)

% Dado un vector de constantes de rigidez, devuelve las posiciones de
% los nodos en un dominio unidimensional.

kp = k(2:end-1).*k(3:end)./(k(2:end-1)+k(3:end));
km = k(1:end-2).*k(2:end-1)./(k(1:end-2)+k(2:end-1));

A = - diag([0,kp],1) - diag([km,0],-1) + ...
    diag([1,+kp+km,1]);

b = zeros(size(k));
b(1) = interval(1);
b(end) = interval(2);

y = (A\b')';
