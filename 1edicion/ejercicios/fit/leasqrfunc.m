function y = leasqrfunc(x,p)

  y=1./(p(1)+p(2)*exp(-x));
