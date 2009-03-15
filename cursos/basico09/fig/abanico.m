x = linspace(0,500,100000);
p = plot(x,exp(-x/100).*sin(x));
set(p,'linewidth',3);
%print -deps 'abanico.eps'
t = title('Una funcion cualquiera')
x = xlabel('Tiempo')
y = ylabel('Amplitud')
set(t,'fontsize',16);
set(x,'fontsize',16);
set(y,'fontsize',16);

print -deps 'abanico2.eps'
