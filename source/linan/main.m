clear all;

M = 160;
N = 40;
Lx1 = 10;
Lx2 = 200;
Ly = 40;

[A,b] = linan(Lx1,Lx2,Ly,M,N);
sol = A\b;
sol = rot90(reshape(sol,M,N));
[xx,yy] = meshgrid(linspace(0,Lx1+Lx2,M),linspace(0,Ly,N));

figure(1);
clf
contour(xx,yy,sol);
hold on
l1 = plot([0,Lx1],[Ly,Ly]);
set(l1,'linewidth',3);
colorbar;
print 'contour.pdf' -depsc
hold off

figure(2);
clf
line = sol(N,:);
plot(linspace(0,Lx1+Lx2,M),line)
print 'perfil.pdf' -depsc

figure(3);
clf
loglog(linspace(0,Lx1+Lx2,M),line)
print 'logperfil.pdf' -depsc
