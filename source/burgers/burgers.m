clear

%%% Linear operator L(uhat,kx)
L = @(uhat,kx) -(kx.^2).*uhat;

%% setting up
N=128;
u0 = @(x) 10.*sin(x);
x = linspace(-pi,pi,N+1);
x = x(1:N);
kx = [1,[1:N/2],[-N/2+1:-1]];
uhat0 = fft(u0(x));

%%% Setting wavenumber as a parameter
Lh = @(uhat) L(uhat,kx);
Dh = @(uhat) D(uhat,kx,N);

%%% Time integration setup
CFL = 0.9;
h = CFL*2/(max(kx).^2+max(u0(x))) %step
tend = 0.1;

%%% Explicit Euler u(n+1) = u(n) + h(L(u(n))-D(u(n)))
t = 0;
while (t < tend)
  uhat0 = uhat0 + h*(Lh(uhat0)-Dh(uhat0));
  t = t + h;
end

%%% analysis of the aliasing thing

figure(1)
clf
plot(abs(fftshift(uhat0)));
title('Power spectra of u at tend');
ylabel('u');
xlabel('kx');

figure(2)
clf
plot(real(ifft(uhat0)));
title('u at tend');
ylabel('u');
xlabel('x');
