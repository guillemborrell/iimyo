%% Modelo de vuelo vertical de un vehiculo con motor cohete

gamma = 1.4;
T0 = 288;
p0 = 101325;
r0 = 1.225;
R = 287;
g = 9.8;
lambda = -6.5E-3;

Gamma = sqrt(gamma)*(2/(gamma+1)).^((gamma+1)/(gamma-1)/2);

cd = @(M) 2.6*M.^(1.1).*exp(-M)+0.3*sqrt(M);
Ta = @(h) T0+lambda*h;
pa = @(h) p0*((T0+lambda*h)/T0).^(g/R/lambda)
ra = @(h) p0*((T0+lambda*h)/T0).^((g/R/lambda)-1)
