function tailcheck(open,clse,dst,n)
% Funcion que representa la cola logaritmica del histograma en funcion
% de la distancia entre las medidas.
% Argumentos de entrada:
%  open: Datos de apertura de sesion
%  clse: Datos de cierre de sesion
%  dst:  Decalaje entre la apertura y el cierre
%  n:    Numero de puntos del histograma
%  fign: Numero de figura en la que se representara la cola
    dis = clse(1:end-dst)-open(1+dst:end);
    bins = linspace(min(dis),max(dis),n);
    freq = histc(dis,bins);
    pdf = freq/trapz(bins,freq);
    semilogy(bins,pdf)