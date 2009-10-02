figure(1)
plot([1,2,3,2,1])

figure(2)
x = linspace(-pi,pi,64);
plot(x,sin(x))

figure(3)
plot(x,sin(x),'ro','markersize',5)

figure(4)
x = linspace(0,500,10000);
plot(x,exp(-x/100).*sin(x));
title('Una funcion cualquiera')
xlabel('Tiempo')
ylabel('Amplitud')

figure(5)
x = linspace(-pi,pi,100);
plot(x,sinh(x),x,cosh(x));
legend('seno hiperbolico','coseno hiperbolico');
