function [x,y] = gendata()
%Genera los datos para el ejercicio de minimos cuadrados generalizados
f=@(xi) 1./(1+2*exp(-xi));
x=linspace(-4,4,100)';
y=f(x+0.2*rand(100,1));
