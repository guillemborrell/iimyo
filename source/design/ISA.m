function [T,p,rho] = ISA(T0,p0)
%
% Modulo que implementa la atmosfera estandar o ISA.
%
% Parametros:
%
%  T0: Temperatura a nivel del mar (altitud cero).
%  p0: Presion a nivel del mar.
%
% Argumentos de salida:
%
%  T: @(h) Temperatura en funcion de la altitud
%  p: @(h) Presion en funcion de la altitud
%  rho: @(h) Densidad a nivel del mar
%

%%% Constantes:

g = 9.81; % Aceleracion de la gravedad a nivel del mar [M s^-2]
Ra = 287; % Constante de gas perfecto para el aire [J kg^-1 K^-1]
lambda = -6.5e-3; % Gradiente termico [K m^-1]

rho0 = p0/Ra/T0; % Densidad a nivel del mar

T =   @(h) T0 + lambda .* h;                           % Temperatura(h)
p =   @(h) p0   .* ( T(h)./T0 ) .^ (-g/Ra/lambda);     % presion(h)
rho = @(h) rho0 .* ( T(h)./T0 ) .^ (-g/Ra/lambda - 1); % densidad(h)
