%%% Script que modela el servicio de tenis

clear;
clf;

%% Constantes y parametros

m = 57.6E-2; % masa de la pelota [kg]
d = 67E-3; % diametro de la pelota [m]
cd0 = 0.65; % coeficiente de resistencia parasita [adim]
l = 11.885*2; % longitud de la pista [m]
lss = 11.885 + 6.4; % distancia al borde de cuadro de saque [m]

%% Condiciones iniciales tentativas para el saque

U0 = 55.5; % velocidad del saque inicial
y0 = 2.7; % altura del saque inicial

%% Creo el handle que depende solo de la altura y calculo
myservice = @(h) servicefunc(m,d,cd0,l,lss,h,U0,y0);
h = linspace(0,4000,10);
fond = zeros(10,1);
for i = 1:10
    fond(i) = myservice(h(i));
end

plot(h,fond);
xlabel('Altitud [m]');
ylabel('Tiempo de vuelo [s]');
print -deps 'saque.eps'
print -dpng 'saque.png'
