clear
clc

%% Solucion estable

k = 10; % Constante de prueba
l = 0.1; % Longitud adimensional

tau = linspace(0,4*pi,100); % Tiempo adimensional

%%% Ecuacion diferencial linealizada del pendulo invertido
pend = @(x,t) [x(2),x(1)*(sin(t)-k)/l];

theta = lsode(pend,[0.01 0],tau); %Integracion

figure(1);
clf;

subplot(2,1,1);
plot(tau,theta(:,1));
xlabel('\tau')
ylabel('\theta')
title('k=10')

subplot(2,1,2);
plot(tau,sin(tau))
xlabel('\tau')
ylabel('y/a')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% k para que la solucion sea inestable

k = 0.1;

%%% Ecuacion diferencial linealizada del pendulo invertido
pend = @(x,t) [x(2),x(1)*(sin(t)-k)/l];

theta = lsode(pend,[0.01 0],tau); %Integracion


figure(2); 
clf;

subplot(2,1,1);
plot(tau,theta(:,1));
xlabel('\tau')
ylabel('\theta')
title('k=0.1')

subplot(2,1,2);
plot(tau,sin(tau))
xlabel('\tau')
ylabel('y/a')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comprobacion del limite de estabilidad de k=1

figure(3);
clf;
tau = linspace(0,10*pi,100); % Mas tiempo adimensional para comprobar la
				% convergencia de la solucion

k = 0.9;

%%% Ecuacion diferencial linealizada del pendulo invertido
pend = @(x,t) [x(2),x(1)*(sin(t)-k)/l];

theta = lsode(pend,[0.01 0],tau); %Integracion

subplot(3,1,1);
plot(tau,theta(:,1));
xlabel('\tau')
ylabel('\theta')
title('k=0.9')

k = 1.1;

%%% Ecuacion diferencial linealizada del pendulo invertido
pend = @(x,t) [x(2),x(1)*(sin(t)-k)/l];

theta = lsode(pend,[0.01 0],tau); %Integracion

subplot(3,1,2);
plot(tau,theta(:,1))
xlabel('\tau')
ylabel('\theta')
title('k=1.1')

k = 1.2;
%%% Ecuacion diferencial linealizada del pendulo invertido
pend = @(x,t) [x(2),x(1)*(sin(t)-k)/l];

theta = lsode(pend,[0.01 0],tau); %Integracion

subplot(3,1,3);
plot(tau,theta(:,1))
xlabel('\tau')
ylabel('\theta')
title('k=1.2')
