function y = leasqrdfdp(x,f,p,dp,func)
  y = [-1./(p(2).*exp(-x)+p(1)).^2, -exp(-x)./(p(2).*exp(-x)+p(1)).^2];
