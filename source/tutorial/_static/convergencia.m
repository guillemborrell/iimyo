exp_serie = @(x,n) polyval(1./[factorial(linspace(n,1,n)),1],x)

x_01 = [exp_serie(0.1,1),
	exp_serie(0.1,2),
	exp_serie(0.1,3),
	exp_serie(0.1,4),
	exp_serie(0.1,5),
	exp_serie(0.1,6),
	exp_serie(0.1,7)];

x_02 = [exp_serie(0.2,1),
	exp_serie(0.2,2),
	exp_serie(0.2,3),
	exp_serie(0.2,4),
	exp_serie(0.2,5),
	exp_serie(0.2,6),
	exp_serie(0.2,7)];


disp('error en 0.1')
err_01 = abs(exp(0.1)-x_01)
disp('error en 0.2')
err_02 = abs(exp(0.2)-x_02)

disp('logaritmo del error en 0.1')
logerr_01 = log(err_01)
disp('logaritmo del error en 0.2')
logerr_02 = log(err_02)
