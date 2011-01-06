from pylab import *

op = load('googopen.dat')
cl = load('googclse.dat')

dif = cl-op
(freq,bins) = histogram(dif,30)
bins = 0.5*(bins[1:]+bins[:-1])

figure(1)
plot(bins,freq)
xlabel('Diferencial')
ylabel('Frecuencia')

pdf = -freq/trapz(bins,freq)
mu = mean(dif)
sig = std(dif)

figure(2)
plot(bins,pdf,bins,normpdf(bins,mu,sig))
xlabel('Diferencial')
ylabel('Probabilidad')
legend(('Histograma','Normal'))

figure(3)
semilogy(bins,pdf,bins,normpdf(bins,mu,sig))
xlabel('Diferencial')
ylabel('Probabilidad')
legend(('Histograma','Normal'))

show()
