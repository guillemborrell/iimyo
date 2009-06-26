clear
clf

%%% Linear operator L(uhat,kx)
L = @(uhat,kx) -(kx.^2).*uhat;

%% setting up
N=64;
u0 = @(x) 10.*sin(x);
x = linspace(-pi,pi,N+1);
x = x(1:N);
kx = [1,[1:N/2],[-N/2+1:-1]];
uhat0 = fft(u0(x));

%%% Setting wavenumber as a parameter
Lh = @(uhat) L(uhat,kx);
Dh = @(uhat) Dnd(uhat,kx,N); % change here

%%% Time integration setup
CFL = 0.9;
h = CFL*2/(max(kx).^2+max(u0(x))) %step
tend = 0.1;

%%% Explicit Euler u(n+1) = u(n) + h(L(u(n))-D(u(n)))
hold on

t = 0;
while (t < tend)
  uhat0 = uhat0 + h*(Lh(uhat0)-Dh(uhat0));
  t = t + h;
end

plot(real(ifft(uhat0)));
