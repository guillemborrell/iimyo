function [ avret,stdret ] = ruleta (d,j,N,c)

  %% Tengo una ruleta imperfecta de 61 casillas (0+36) de la que sé que
  %% el rojo (con el negro funcionaría exactamente de la misma manera)
  %% tiene más probabilidades de aparecer que el negro. Si su
  %% probabilidad debería ser 18/37, en realidad es 18/37*(1+d), donde d
  %% es un número pequeño. Mi objetivo es saber, mediante una simulacion
  %% Montecarlo, el ritmo al que me enriquezco o me empobrezco.

  %% El experimento deberá repetirse muchas veces puesto que el valor
  %% que me interesa es el valor asintótico después de infinitos juegos

  %% d es la desviación de la ruleta
  %% j es el número de apuestas
  %% N es el número de juegos
  %% c es la cantidad que apuesto en cada tirada

avret = 0;
stdret = 0;

for i=1:N
  bet = rand(j,1);
  ret = cumsum((bet<(18/37*(1+d)))-(bet>(18/37*(1+d))));
  avret += ret;
  stdret += ret.^2;
end

avret = avret/N;
stdret = sqrt(stdret/N-avret.^2);

endfunction
