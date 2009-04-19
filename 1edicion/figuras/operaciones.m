x=linspace(1,100000,1000);
semilogy(x,x.^2,x,x.*log(x));
xlabel('N');
ylabel('Operaciones');
legend('N^2','N log(N)');
print -deps operaciones.eps
