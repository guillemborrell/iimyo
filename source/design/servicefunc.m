function tfondo = servicefunc(m,d,cd0,l,lss,h,U0,y0)
% Funcion que calcula el tiempo de vuelo del servicio de una pelota
% de tenis seguno los argumentos siguientes
% 
% Argumentos de entrada:
% 
%   m: masa de la pelota de tenis
%   d: diametro de la pelota de tenis
%   cd0: coeficiente de resistencia parasita
%   l: longitud de la pista de tenis
%   lss: distancia desde el sacador al bote
%   h: altitud a la que se juega el partido
%   U0: velocidad inicial del saque
%   y0: altura del impacto con la bola desde el suelo
%   
% Argumento de salida
% 
%   tfondo: tiempo que tarda la pelota en cruzar la pista

%% Constantes

theta0 = -0.2;
g = 9.81; % Aceleracion de la gravedad [m s^-2]
  
%% Adimensionalizacion
xiss = lss/l;
eta0 = y0/l;
xih = @(theta,eta) [0;eta;cos(theta);sin(theta)]; % handle para
				% condiciones iniciales

%% Atmósfera ISA
[T,p,rho] = ISA(289,101325); %Dia estandar

%% parametro gamma
gammah = @(g,l,U0) g.*l/U0.^2;

%% parametro delta
deltah = @(d,l,m,xi,rho,h,cd0) ...
    pi/8*d.^2.*l./m.*(xi(3).^2+xi(4).^2).*rho(h).*cd0;

%% funciones coseno y seno
costheta = @(xi) xi(3)./sqrt(xi(3).^2+xi(4).^2);
sintheta = @(xi) xi(4)./sqrt(xi(3).^2+xi(4).^2);

%% funcion a integrar

fh = @(delta,gamma,costheta,sintheta,t,xi) ...
    [xi(3);xi(4);-delta(xi).*costheta(xi);-gamma-delta(xi).*sintheta(xi)];

%% union de bloques
gamma = gammah(g,l,U0);
delta = @(xi) deltah(d,l,m,xi,rho,h,cd0);
f = @(t,xi) fh(delta,gamma,costheta,sintheta,t,xi);

%% Busco el angulo para el saque perfecto.
errbotef = @(theta) errbote(f,xih,theta,eta0,xiss);
thetaideal = fsolve(errbotef,theta0);

%% Integro hasta el bote
persistent vopt;
vopt = odeset('RelTol',1e-6,'AbsTol',1e-6);
xi0 = xih(thetaideal,eta0);
[t1,x1] = ode45(f,[0,1],xi0,vopt);
tbote = interp1(x1(:,2),t1,0);

%% Calculo tiempo y velocidad en el bote para rehacer las condicines
% inciales, luego obtengo el tiempo para llegar al fondo de la pista
dxi1 = interp1(t1,x1(:,3),tbote);
deta1 = interp1(t1,x1(:,4),tbote);
xi1 = [xiss;0;dxi1;-deta1];
[t2,x2] = ode45(f,[tbote,2],xi1,vopt);
tfondo = interp1(x2(:,1),t2,1);
tfondo = tfondo*l/U0; %tiempo con dimensiones