%% Programa para obtener el lugar de las raices del pendulo invertido
g = 10;
w = 200*2*pi/360;
l = 1;
t = linspace(0,2*pi/w,100);

figure(1)
clf;
k = {0.1,'b*';
     1,'r*';
     5,'k*';
     10,'g*'};
hold on
for iter = 1:4
  plot(t,1-k{iter,1}*sin(w*t),k{iter,2})
end
plot([0,2*pi/w],[0,0])
xl = xlabel('t');
yl = ylabel('\Delta');
set(xl,'fontsize',14);
set(yl,'fontsize',14);
legend('k=0.1','k=1','k=5','k=10');
hold off

print -dpng 'discriminante.png'
print -deps 'discriminante.eps'

figure(2)
clf;

info={0.1,'b*','k = 0.1';
      1,'r*','k = 1';
      5,'k*','k = 5';
      10,'g*','k = 10'};

for iter = 1:4
  k = info{iter,1};
  marker = info{iter,2};
  titlestring = info{iter,3};
  subplot(2,2,iter);
  plot(real(sqrt(g*(1-k*sin(w*t))/l)),
       imag(sqrt(g*(1-k*sin(w*t))/l)),
       marker);
  keyboard;
  t = title(titlestring);
  xl = xlabel('Re');
  yl = ylabel('Im');
  set(t,'fontsize',14);
  set(xl,'fontsize',14);
  set(yl,'fontsize',14);
end

print -dpng 'autovalores.png'
print -deps 'autovalores.eps'

