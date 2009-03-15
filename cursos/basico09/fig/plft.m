clf;
x=[1 2 3 4 5 6 7 8];
y=[2 4 3 5 6 5 7 9];
coeff=polyfit(x,y,3);
p = plot(x,y,'k+',1:0.1:8,polyval(coeff,1:0.1:8),'b-');
set(p,'linewidth',3);
set(p,'markersize',16);
set(gca,'fontsize',16);
print -deps 'polyfit.eps'
