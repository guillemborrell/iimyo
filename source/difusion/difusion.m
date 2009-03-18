%% Problema de difusion bidimensional no isotropa

%%% Parametros
mu = nu = A = 1;
Kxx = Kyy = 1;
Kxy = Kyx = 0.5;

%%% Geometria del dominio

M = 100; %Numero de puntos en x
N = 100; %Numero de puntos en y
Lx = 20; %Longitud del dominio en x
Ly = 20; %Longitud del dominio en y
[XX,YY] = meshgrid(linspace(-Lx/2,Lx/2,M),...
		   linspace(-Ly/2,Ly/2,N));
dx = Lx/(M-1);
dy = Ly/(N-1);

%%% Condicion inicial
Yc0 = @(A,mu,nu) @(x,y) A*exp(-mu*x.^2-nu*y.^2);
Yc0case = Yc0(A,mu,nu);
Yc0num = Yc0case(XX,YY);

%%% RHS
Fi = @(u,t) F(u,t,dx,dy,Kxx,Kyy,Kxy,Kyx,M,N);

%%% Integracion temporal
Nt = 10;
t = linspace(0,0.0001,Nt);
Yc = lsode(Fi,reshape(Yc0num,M*N,1),t);
Yc = reshape(Yc,M,N,Nt);
