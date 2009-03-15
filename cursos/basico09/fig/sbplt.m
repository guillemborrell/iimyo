x = linspace(-pi,pi,100);
subplot(2,2,1);
p = plot(x,sin(x));
set(p,'linewidth',2);
print -deps 'subplot1.eps'
subplot(2,2,2)
p = plot(x,cos(x));
set(p,'linewidth',2);
subplot(2,2,3)
p = plot(x,sinh(x));
set(p,'linewidth',2);
subplot(2,2,4)
p = plot(x,cosh(x));
set(p,'linewidth',2);
print -deps 'subplot2.eps'
