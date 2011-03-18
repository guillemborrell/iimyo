%%% Programa de simulacion vehiculo con motor cohete a p_c constante
%%% Version para Matlab

clear;

%% ISA
g = 9.81;                  % gravedad terrestre [m/s^2]
gair = 1.4;                % gamma aire
Ra = 287;                  % constante MGP aire [J/kg/K]

[T,p,rho] = ISA(288,101325);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Especificaciones Cohete 
p_c = 20e6;                % presion camara de combustion  [Pa]
Sf = 0.4;                  % area frontal                  [m^2]
Ag = 0.01;                 % area garganta                 [m^2]
As = Sf;                   % area salida                   [m^2]
mcohe = 25;                % masa cohete                   [kg]
mcomb = 30;                % masa inicial combustible      [kg]
m0    = mcohe + mcomb;     % masa inicial total            [kg]
rho_c = 1800;              % densidad combustible solido   [kg/m^3]

%%% Hallo el consumo
k  = 0.2e-2/(50*101325)^0.7 ;  % constante para hallar consumo
mp = rho_c * Sf * k * p_c^0.7 ;  % consumo   [kg/s]

%%% Hallo la presion de salida
Gam = sqrt(gair) * (2 / (gair+1))^((gair+1) / 2 / (gair-1));
				% constante Gamma(gamma)

ecuacion = @(p_s) As/Ag - Gam /...
    sqrt( 2*gair * ...
	 (1 - (p_s/p_c) ^ ((gair-1)/gair) ) /...
	 (gair-1)...
	 ) /...
    (p_s/p_c) ^ (1/gair);   % ecuacion que relaciona areas

p_s = fsolve(ecuacion, 5e5);      % presion de salida

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Resistencia aerodinamica: D(v,h)
Mach = @(v,h) v ./ sqrt( gair .* Ra .* T(h) );        % Mach
Cd =   @(v,h) 2.6 .* Mach(v,h) .^(1.1) .* exp(-Mach(v,h))...
              + 0.6 .* sqrt(Mach(v,h));               % coef. resist.

D = @(v,h) rho(h) .* v.^2 .* Sf .* Cd(v,h) ./ 2;      % resistencia aero.

%% Empuje Motor: E(h)
E = @(h) p_c .* Ag .* Gam .*...
    sqrt( 2*gair * ...
	 (1 - (p_s/p_c) ^ ((gair-1)/gair) ) /...
	 (gair-1)...
	 ) + ...
    As .* ( p_s./p_c - p(h)./p_c ) ./ Ag;
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Datos de entrada a ode45

%%% Sistema de ecuaciones
acel  = @(v,h,t) (E(h) - D(v,h) - mp.*v) ./...
    (m0 - mp.*t) - g;                      % con combustible
      
acel2 = @(v,h,t) -D(v,h)./mcohe - g;       % sin combustible

%%% NOTA: h = x(1), v = x(2);
%%% Sistema: 1. dh/dt = v
%%%          2. dv/dt = f(h,hp)
F  = @(t,x) [ x(2,1); acel(x(2,1) ,x(1,1),t)];
F2 = @(t,x) [ x(2,1); acel2(x(2,1),x(1,1),t)];

%%% tiempo en el que se termina el combustible
tfin1 = mcomb/mp; %[s]

%%% condiciones iniciales
x0(1,1) = 0;     % A nivel del mar [m]
x0(2,1) = 0;     % En reposo       [m/s]

%% Integrando...
[tcomb,x] = ode45(F,[0 tfin1],x0);         % con combustible,

x0_2 = [x(length(x),1); x(length(x),2)];   % entrada a 2º sistema
tfin2 = 20;                                % tiempo fin integracion [s]
[tfin,x2] = ode45(F2,[tfin1 tfin2],x0_2);  % sin combustible,


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Graficos

% h(m)   frente a t(s)
figure(1);
hold on
plot(tcomb,  x(:,1), '-b',...
     tfin, x2(:,1),'-r', 'LineWidth',1)
plot(tcomb(end),x(end,1),'ko','MarkerSize',10)
hold off
xlabel('t [s]', 'FontSize',11);
ylabel('h [m]', 'FontSize',11);


% v(km/s) frente a t(s)
figure(2);
hold on
plot(tcomb,x(:,2)*1e-3, '-b',...
     tfin,x2(:,2)*1e-3,'-r', 'LineWidth',1)
plot(tcomb(end),x(end,2)*1e-3,'ko','MarkerSize',10)
hold off
xlabel('t [s]', 'FontSize',11);
ylabel('v [ km / s ]', 'FontSize',11);

% Mach frente a t(s)
figure(3);
hold on
plot(tcomb,Mach(x(:,2),x(:,1)), '-b',...
     tfin,Mach(x2(:,2),x2(:,1)),'-r', 'LineWidth',1)
hold off
xlabel('t [s]', 'FontSize',11);
ylabel('M', 'FontSize',11);


% a(km/s^2) frente a t(s)
figure(4);
plot(tcomb, acel(x(:,2),x(:,1),tcomb).*1e-3, '-b',...
     tfin,acel2(x2(:,2),x2(:,1).*1e-3,tfin),'-r', 'LineWidth',1)
xlabel('t [s]', 'FontSize',11);
ylabel('a [ km / s^2 ]', 'FontSize',11);
axis([0,tfin(end),-2*g,2*g]);
