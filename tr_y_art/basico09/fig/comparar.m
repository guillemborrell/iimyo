x=linspace(-pi,pi,100);
for i = 1:100
  y(i)=aprsin(x(i));
end
p=plot(x,[y;sin(x)]);
set(p,'linewidth',2);
print -deps 'comparar.eps'
