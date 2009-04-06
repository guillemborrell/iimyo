function y = modvdp(mu)
%%
%% Modulo.  Generador de la ecuacion de Van der Pol
%%
%% Argumentos de entrada:
%%
%%  mu: parametro del amortiguamiento no lineal
%%
%% Argumentos de salida:
%%
%%  y: @(t,x) Ecuacion de Van der Pol

y = @(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];
