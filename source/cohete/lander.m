% script misiles

% defino D

S = 1;
T = 100;
rho = 1;
gamma   = 1.4;
R = 287;
h = 7000;

a = sqrt(gamma*R*T);

D = @(M) 0.5.*rho.*M.^2.*S.*(0.3+M.*exp(-M))*a^2;
gp = @(M,t) g(M,t,h,D,a);

t = linspace(0,14.5,1000);
MM = lsode(gp,0.7,t);
plot(t,MM);
