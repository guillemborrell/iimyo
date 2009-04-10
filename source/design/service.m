%%% Script que modela el servicio de tenis

clear;
clf;

%% Constantes y parametros

m = 57.6E-2; % masa de la pelota [kg]
d = 67E-3; % diametro de la pelota [m]
g = 9,81; % aceleracion de la gravedad [m s^-2]
cd0 = 0.65; % coeficiente de resistencia parasita [adim]
l = 11.885*2; % longitud de la pista [m]
lss = 11.885 + 6.4; % distancia al borde de cuadro de saque [m]
xiss = lss/l; % distancia al borde de cuadro de saque [adim]

h = 0; % altitud [m]

%% Condiciones iniciales tentativas para el saque

U0 = 55.5; % velocidad del saque inicial
theta0 = - 0.26; % angulo del saque inicial
y0 = 2.7; % altura del saque inicial
eta0 = y0/l; % altura del saque inicial adimensional

xih = @(theta,eta0) [0;eta0;cos(theta);sin(theta)]; % handle para
				% condiciones iniciales

%% Atmósfera ISA
[T,p,rho] = ISA(289,101325); %Dia estandar

%% parametro gamma
gammah = @(g,l,U0) g.*l/U0.^2;

%% parametro delta
deltah = @(d,l,m,xi,rho,h,cd0) \
    pi/8*d.^2.*l./m.*(xi(3).^2+xi(4).^2).*rho(h).*cd0;

%% funciones coseno y seno
costheta = @(xi) xi(3)./sqrt(xi(3).^2+xi(4).^2);
sintheta = @(xi) xi(4)./sqrt(xi(3).^2+xi(4).^2);

%% funcion a integrar

fh = @(delta,gamma,costheta,sintheta,t,xi) \
    [xi(3);xi(4);-delta(xi).*costheta(xi);-gamma-delta(xi).*sintheta(xi)];

%% union de bloques
gamma = gammah(g,l,U0);
delta = @(xi) deltah(d,l,m,xi,rho,h,cd0);
f = @(t,xi) fh(delta,gamma,costheta,sintheta,t,xi);

%% Busco el angulo para el saque perfecto.
errbotef = @(theta) errbote(f,xih,theta,eta0,xiss);
thetaideal = fsolve(errbotef,theta0);

%% Integro hasta el bote
vopt = odeset();
xi0 = xih(thetaideal,eta0);
[t1,x1] = ode45(f,[0,1],xi0,vopt);
tbote = interp1(x1(:,2),t1,0);

%% Calculo tiempo y velocidad en el bote para rehacer las condicines
%% inciales, luego obtengo el tiempo para llegar al fondo de la pista
dxi1 = interp1(t1,x1(:,3),tbote);
deta1 = interp1(t1,x1(:,4),tbote);
xi1 = [xiss;0;dxi1;-deta1];
[t2,x2] = ode45(f,[tbote,2],xi1,vopt);
tfondo = interp1(x2(:,1),t2,1);

%% Pinto la solucion
xd1 = @(tau) interp1(t1,l*x1(:,1),tau);
yd1 = @(tau) interp1(t1,l*x1(:,2),tau);
xd2 = @(tau) interp1(t2,l*x2(:,1),tau);
yd2 = @(tau) interp1(t2,l*x2(:,2),tau);

tau1 = linspace(0,tbote,100);
tau2 = linspace(tbote,tfondo,50);
plot(xd1(tau1),yd1(tau1),xd2(tau2),yd2(tau2))
