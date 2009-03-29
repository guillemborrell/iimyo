function [vdp] = modvdp(mu)
  vdp=@(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];
