%%% Funcion para calcular el maximo valor del paso de tiempo dt

function dt=estabilidadRK4(k,lambda)

N = 32;                               % Numero de puntos para r=exp(i*theta)
dtheta = 2*pi/N;                      % Incremento de theta
theta = (0:dtheta:2*pi-dtheta);       % Linspace de theta

[lambdamax,poslambdamax] = max((abs(lambda)));    % Calculo el maximo autovalor de lambda y su posicion

r = exp(i.*theta);        % Definición de r = exp(i*theta)

%% Bucle para resolver el polinomio caracteristico de estabilidad (RUNGE-KUTTA 4)
% r = 1 + w + 1/2*w^2 + 1/6*w^3 + 1/24*w^4 

ecuacion(1:N,1)=1./24;
ecuacion(1:N,2)=1./6;
ecuacion(1:N,3)=1./2;
ecuacion(1:N,4)=1;
ecuacion(1:N,5)=1-r(:);

for j=1:N
    w(j,:)=roots(ecuacion(j,:));        % Calculo las raices del polinomio
end

%% Calculo el maximo valor del paso de tiempo dt

dt=w/lambda(poslambdamax);      % Despejo dt de la ecuacion w = landa * dt (dt complejo)
dt=max(max(real(dt)));          % Tomo la parte real del dt anteriormente calculado y obtengo el maximo valor de dt       
dt=0.95.*dt;                    % Considero q tengo un error de calculo y el dt final es el 95% del anteriormente calculado

lambdadt=lambda.*dt;            % Defino la funcion lambdadt = lambda * dt

%% Dibujo de la region de estabilidad (w) y de los puntos lambda * dt

figure
hold on
plot(real(w),imag(w),'b*');
plot(real(lambdadt),imag(lambdadt),'ro');
xlabel('real ( w )'); ylabel('imag ( w )'); title('R E G I O N  D E  E S T A B I L I D A D');
axis([-3 3 -3 3]);
grid;
hold off