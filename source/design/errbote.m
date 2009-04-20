function y = errbote(f,xih,theta,eta0,xiss)
% Funcion que determina el error del bote en el saque
%
% Argumentos de entrada
%
%  f: @(t,xi) Ecuacion de la dinamica de la trayectoria
%  xih: @(theta,y0) Bloque que crea las condiciones iniciales
%  theta: Angulo de saque inicial
%  eta0: altura del impacto de la pelota respecto al suelo [adim]
%  xiss: distancia del punto objetivo al sacador [adim]
%
% Argumentos de salida
%
%  y: distancia entre el punto de bote y el objetivo

%% funcion que obtiene el punto de bote

bote = @(x) interp1(x(:,2),x(:,1),0);
xi0 = xih(theta,eta0);
vopt = odeset();
[t,x] = ode45(f,[0 10],xi0,vopt); %integro hasta tau=1
y = bote(x(:,[1,2]))-xiss;




