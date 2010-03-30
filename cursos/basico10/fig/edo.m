mu = 1;
vdp = @(x) [x(2),mu*(1-x(1).^2)*x(2)-x(1)];
x = linspace(0,20,1000);
y = lsode(vdp,[0 2],x);
p = plot(x,y(:,1));
set(p,'linewidth',3);
set(gca,'fontsize',16);
print -deps 'vdp1.eps'

mu = 1000;
x = linspace(0,3000,100000);
vdp = @(x) [x(2),mu*(1-x(1).^2)*x(2)-x(1)];
y = lsode(vdp,[0 2],x);
p = plot(x,y(:,1));
set(p,'linewidth',3);
set(gca,'fontsize',16);
print -deps 'vdp1000.eps'
