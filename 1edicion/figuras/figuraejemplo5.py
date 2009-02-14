from pylab import *
x = linspace(0, 500, 10000)
plot(x,exp(-x/100)*sin(x))
title(r'${Ae}^{-\alpha t}sin \beta t \ \ \alpha << \beta$')
xlabel('$Tiempo\ \ (\mu s)$')
ylabel('$Amplitud\ \ (mV)$')
savefig('figuraejemplo5.pdf',format='pdf')
