%%% Linear operator L(uhat,kx)
L = @(uhat,kx) -(kx.^2).*uhat;

%% setting up
N=64;
u0 = @(x) sin(x);
x = linspace(-pi,pi,N+1);
x = x(1:N);
kx = [1,[1:N/2],[-N/2+1:-1]];
uhat0 = fft(u0(x));

%%% Setting wavenumber as a parameter
Lh = @(uhat) L(uhat,kx);
Dh = @(uhat) D(uhat,kx,N);

%%% And the function is
ut = @(uhat) Lh(uhat)-Dh(uhat);
