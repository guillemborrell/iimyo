T0 = 288;
p0 = 101325;
gamma = 1.4;

[T,p,rho] = ISA(T0,p0);

qc = @(h,CAS) p(h).*((1+0.0004978*CAS.^2./T(h)).^3.5-1);
M = @(qc,h) sqrt(2/(gamma-1)*((qc./p(h)-1).^((gamma-1)/gamma)-1));

h = linspace(0,10000,100);
CAS = 100;

plot
