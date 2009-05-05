%%% Resolucion por Fourier de la funcion     du/dt + u * du/dx = c * d2u/dxx

tic
clear all
close all
clc

c = 1;
%% Espacio

Lx=2*pi;                    % Longitud espacio x
Nx=50;                      % Numero de puntos del expacio x
dx=Lx/Nx;                   % Incremento de x
x=linspace(0,Lx-dx,Nx);     % espaciado de x

%% condicion inicial y su transformada (Necesario para determinar el dt)
% u(x,0) = 10 * sin (x)

u0=10*sin(x);
u0fft=fft(u0);

[Cmax,posCmax]=max((abs(u0fft)));                       % Constante real para determinar el dt maximo 

k=[0:Nx/2-1 0 -Nx/2+1:-1]*2*pi/Lx;                      % Armonicos k
lambda=-(i.*real(u0fft(posCmax)).*k+c.*k.^2);           % Autovalor lambda de la funcion du/dt = lambda * u (en Fourier);
                                                        % lambda = - ( i * C(real) * k + k^2)

%% Tiempo

Lt=1;                           % Tiempo t
dt=estabilidadRK4(k,lambda)     % Funcion para calcular el paso de tiempo ESTABLE
Nt=floor(Lt/dt+1);              % Numero de puntos en el tiempo
t=linspace(0,Lt,Nt);            % Linspace de t

% vector solucion "ut" espacio de fourier (definicion de las dimensiones)
ut=zeros(Nt,Nx);

% condicion inicial y su transformada
% u(x,0) = 10 * sin (x)

u0=10*sin(x);
u0fft=fft(u0);
ut(1,:)=u0fft;

% Bucle para resolver la ecuacion mediante un Runge-Kutta 4

kk=-c.*k(1,:).*k(1,:);                              % Defino una constante kk = - c .* k * k

for n=1:Nt-1
    dut(1,:)=i.*k(1,:).*ut(n,:);                    % du/dx en el espacio de fourier        dut = i .* k .* ut
    u(1,:)=ifft(ut(n,:));                           % vector u en el espacio real           
    du(1,:)=ifft(dut(1,:));                         % vector du/dx en el espacio real
    udu(1,:)=u(1,:).*du(1,:);                       % u*du/dx en el espacio real            udu = u .* du
    udut(1,:)=fft(udu(1,:));                        % u*du/dx en el espacio de fourier
         
    k1(n,:)=(kk.*ut(n,:)-udut(1,:));                    % k1 de Runge-Kutta 4
    utk1(1,:)=ut(n,:)+dt.*k1(n,:)/2;                    % utk1 = ut(n,:) + k1 .* dt ./ 2
    udutk1(1,:)=Trans_udut(n,k,utk1(1,:));              % Funcion que calcula u*du/dx para el nuevo valor utk1
    
    k2(n,:)=kk.*(ut(n,:)+dt.*k1(n,:)/2)-(udutk1(1,:));  % k2 de Runge-Kutta 4
    utk2(1,:)=ut(n,:)+dt.*k2(n,:)/2;                    % utk2 = ut(n,:) + k2 .* dt ./ 2
    udutk2(1,:)=Trans_udut(n,k,utk2(1,:));              % Funcion que calcula u*du/dx para el nuevo valor utk2
    
    k3(n,:)=kk.*(ut(n,:)+dt.*k2(n,:)/2)-(udutk2(1,:));  % k3 de Runge-Kutta 4
    utk3(1,:)=ut(n,:)+dt.*k3(n,:)/2;                    % utk3 = ut(n,:) + k3 .* dt ./ 2
    udutk3(1,:)=Trans_udut(n,k,utk3(1,:));              % Funcion que calcula u*du/dx para el nuevo valor utk3
   
    k4(n,:)=kk.*(ut(n,:)+dt.*k3(n,:))-(udutk3(1,:));    % k4 de Runge-Kutta 4
    
    ut(n+1,:)=ut(n,:)+dt./6.*(k1(n,:)+2.*k2(n,:)+2.*k3(n,:)+k4(n,:));   % SOLUCION por RK4 ut(n+1) = ut(n) + dt/6*(k1+2*k2+2*k3+k4)
end

% Antitransformando...

U=ifft(ut.');
U=U.';
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Representación de la solucion

figure

%% Para t = 0

plot(x,U(1,:)) 
hold on

%% Para t = 0.1 * Lt

t1=round(0.1/dt);
plot(x,U(t1,:),'-.k')

%% Para t = 0.2 * Lt

t2=round(0.2/dt);
plot(x,U(t2,:),'--r')

%% Para t = 0.4 * Lt

t3=round(0.4/dt);
plot(x,U(t3,:),'-.b')

%% Para t = 0.6 * Lt

t4=round(0.6/dt);
plot(x,U(t4,:),'-- k')

%%

hold off

xlabel('x'); ylabel('u(x,t)'); title('E C U A C I O N  D E  B U R G E R S')
axis([0 2*pi -11 11]);
grid;

toc