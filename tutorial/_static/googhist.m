op = load('googopen.dat');
cl = load('googclse.dat');

dif = cl-op;
bins = linspace(min(dif),max(dif),30);
freq = histc(dif,bins);

figure(1)
plot(bins,freq);
xlabel('Diferencial');
ylabel('Frecuencia');

pdf = freq/trapz(bins,freq);
mu = mean(dif);
sig = std(dif);
kur = kurtosis(dif);
ske = skewness(dif);

figure(2)
plot(bins,pdf,bins,normpdf(bins,mu,sig))
xlabel('Diferencial');
ylabel('Probabilidad');
legend('Histograma','Normal');