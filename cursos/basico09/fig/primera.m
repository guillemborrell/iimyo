x=linspace(1,5,100);
intbessel=@(y) quad(@(x) besselj(2.5,x),0,y);
for i=1:100
  z(i)=intbessel(x(i));
end
p=plot(x,z);
set(p,'linewidth',2);
print -deps 'primera.eps'
