clear
clc

%% Solucion estable

tau = linspace(0,4*pi,100); % Tiempo adimensional

%%% Generador de la ecuacion:
%%% Parametros: k,l
%%% Variables: x,t

genpend = @(k,l) @(x,t) [x(2),x(1)*(sin(t)-k)/l];

%%%

				% k = 10
				% l = 0.1
theta = lsode(genpend(10,0.1),[0.01 0],tau); %Integracion

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

print -dpng 'k10.png'
print -deps 'k10.eps'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Caso inestable
				% k = 0.1
				% l = 0.1
theta = lsode(genpend(0.1,0.1),[0.01 0],tau); %Integracion

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

print -dpng 'k01.png'
print -deps 'k01.eps'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comprobacion del limite de estabilidad de k=1

figure(3);
clf;
tau = linspace(0,10*pi,100); % Mas tiempo adimensional para comprobar la
				% convergencia de la solucion

idx = 1;
klist = [0.9,1.1,1.2];

for k = klist
  theta = lsode(genpend(k,0.1),[0.01 0],tau); %Integracion
  subplot(3,1,idx);
  plot(tau,theta(:,1));
  xlabel('\tau');
  ylabel('\theta');
  title(['k=',+num2str(k)]);
  idx++;
end

print -dpng 'convergencia.png'
print -deps 'convergencia.eps'
