% genero las dos señales

x=linspace(0,2*pi,10000);
x=x(1:end-1); %Truco del mandruco
s=sin(x)/5;
p=sin(100*x);

% sumo las dos señales

input=s+p;

% rectifico la señal
input=(input+sqrt(input.*input))/2;

espectro=fft(input);
espectro(1:50)=0;
espectro(150:end)=0;

output=ifft(espectro);
plot(x,output);
