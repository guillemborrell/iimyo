%% Determinar el intervalo del origen en el que se verifica
%% x+x.^3/3 < tan(x) < x+x.^3/2

%% Ver que pinta tiene esto

mayor=@(x) x+x.^3/3 - tan(x);
menor=@(x) tan(x) - (x+x.^3/2);
x=linspace(-1,1,100);
plot(x,mayor(x),x,menor(x));

%% Pruebo con una máscara lógica

xx=linspace(-5,5,1000);
mascara = mayor(xx)<0 & menor(xx)<0;
figure(2)
plot(xx,mascara);

%% Resolver las ecuaciones

raiz1=fsolve(mayor, 0);
raiz2=fsolve(menor, 0);
