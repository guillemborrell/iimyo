Estadística Descriptiva y análisis de datos
===========================================

En este capítulo nos centraremos en los cálculos más básicos de la
Estadística Descriptiva y de los modelos de datos con Matlab. Esta
pequeña introducción no cuenta con una descripción teórica de los
cálculos así que se suponen conocimientos básicos de Estadística. En
vez de describir de forma sistemática las funciones como en las
secciones anteriores, avanzaremos siguiendo un ejemplo.

.. warning::

   Algunas de las funcionalidades más específicas para el tratamiento
   estadístico de datos con Matlab se encuentran en el Statistics
   Toolbox y deben adquirirse a parte.  En el caso de Octave podemos
   instalar el paquete extra de estadística de Octave-forge en
   http://octave.sourceforge.net.

Distribuciones de frecuencias
-----------------------------

Cuando analizamos datos la primera pregunta que debemos hacernos es si
se ajustan a algún patrón.  Los datos pueden ser muy numerosos y estar
dispersos así que un ordenador nos puede ser de gran utilidad.
Detectar el patrón depende en gran medida de la complejidad de los
datos; no es lo mismo analizar cómo funciona una ruleta en un casino
que hacer lo mismo con un resultado electoral en Estados Unidos.

Supongamos que estamos ante una serie de datos como, por ejemplo, la
cotización de las acciones de Google en la apertura y cierre de NASDAQ
durante cuatro años.

.. only:: latex

  .. raw:: latex

    \embedfile{../../source/_static/googopen.dat}
    \embedfile{../../source/_static/googclse.dat}


  .. note::

    Adjuntos al documento pdf encontraréis los arhivos *googopen.dat* y
    *googclse.dat* necesarios para repetir los ejemplos.


.. only:: html

  .. note::

    Para repetir los ejemplos necesitamos los archivos *googopen.dat*
    y *googclse.dat* que podéis descargar de
    http://iimyo.forja.rediris.es/tutorial/googopen.dat y
    http://iimyo.forja.rediris.es/tutorial/googclse.dat 

.. note::

  Antes de entrar en el tema de la *persistencia* lo único que debemos
  saber a estas alturas es que para cargar estos dos archivos basta
  con utilizar el comando ``load``.

.. code-block:: matlab

  op = load('googopen.dat');
  cl = load('googclse.dat');

En vez de analizar los datos de apertura y cierre nos centraremos en
la diferencia entre ambos valores, la cotización de la sesión, mucho
más fáciles de analizar.  En breve veremos el porqué.

Lo primero que podemos calcular es el histograma de nuestros
datos. Podemos hacerlo de dos maneras: representando gráficamente el
histograma con ``hist`` o calculando las frecuencias con ``histc`` y
utilizando el comando ``plot``

.. code-block:: matlab

   dif = cl-op
   bins = linspace(min(dif),max(dif),30)
   freq = histc(dif,bins);
   plot(bins,freq);
   xlabel('Diferencial')
   ylabel('Frecuencia')

.. only:: latex

   .. figure:: _static/histograma.pdf
      :align: center
      :scale: 70

      Histograma de los diferenciales del stock de Google

.. only:: html

   .. figure:: _static/histograma.png
      :align: center
      :scale: 100

      Histograma de los diferenciales del stock de Google

El histograma está sólo a un paso de la FDP (Función Densidad de
Probabilidad) obtenida a partir de los datos.  Para ello la función
definida por las frecuencias deberá cumplir la siguiente propiedad:

.. math::

  \int_{-\infty}^{\infty} f(x) dx = 1

Para normalizar nuestro histograma basta con dividir las frecuencias
por el valor de su integral utilizando la función ``trapz``

.. code-block:: matlab

  pdf = freq/trapz(bins,freq);



Medidas de concentración
------------------------

Las siguientes funciones sirven para calcular las medidas de tendencia
central de una muestra.

.. function:: mean(x,dim)

   Calcula la media aritmética de una muestra. *dim* sirve para
   seleccionar la dimensión a través de la cual se calcula la media en
   el caso que los datos tengan forma de matriz.

.. function:: geomean(x,dim)

   Funcionamiento idéntico a ``mean``. Calcula la media geométrica de
   una muestra.

.. function:: harmmean(x,dim)

   Funcionamiento idéntico a ``mean``. Calcula la media armónica de
   una muestra.

.. function:: median(x,dim)
   
   Funcionamiento idéntico a ``mean``. Calcula la mediana de una
   muestra.


Medidas de dispersión
---------------------

Hay dos definiciones para la desviación típica.  En algunos libros se
llaman respectivamente cuasidesviación típica y desviación típica.  En
Matlab, por defecto, la desviación típica será calculada con

.. math::

   s(x_i) = \sqrt{\frac{1}{N-1}\sum_{i=1}^N(x_i - \bar x)^2 n_i}

.. function:: std(x,flag,dim)

   Calcula la desviación estándar de una muestra.  Si el argumento
   *flag* se omite o *flag* = 0 se utiliza la definción anterior de la
   desviación típica.  Si se introduce el valor de *flag* = 1 entonces
   se utiliza la definición anternativa de la desviación típica.

La definición alternativa es

.. math::

   \sigma(x_i) = \sqrt{\frac{1}{N}\sum_{i=1}^N(x_i - \bar x)^2 n_i}

.. function:: var(x,flag,dim)

   Calcula la varianza de una muestra.  Es el cuadrado de la
   desviación típica.


Ejemplo
-------

Las funciones de las que hemos hablado sólo sirven en el caso que ya
dispongamos de todos los datos almacenados en un vector o una matriz,
algo que no siempre es posible.  Supongamos que queremos calcular la
media de un vector que cambia durante una gran cantidad de
iteraciones. Si el vector es largo, el número de iteraciones es grande
y queremos utilizar alguna de estas funciones entonces deberemos
guardar en la memoria una enorme matriz. No parece una buena decisión.

Un truco bastante usual en Cálculo Numérico es el de acumular la media
y la desviación típica a medida que se suceden las iteraciones.  La
fórmula de la media no tiene ningún misterio, simplemente se van
sumando todos los valores y al final se divide por la cantidad. Sin
embargo la desviación típica debe calcularse con una fórmula
alternativa.

Se demuestra que la desviación típica es también la esperanza del
valor cuadrático menos el cuadrado de la esperanza de la medida:

.. math::

  \sigma(x) = \sqrt{E(x^2)-[E(x)].^2}

Vamos a aplicarlo a un caso sencillo. Un croupier del casino de
Torrelodones nos dice que una de las ruletas del casino está
ligeramente desviada al color rojo, exactamente un 1/30 más de las
veces esperadas.  Esto significa que, si la probabilidad de ganar al
rojo normalmente sería de 18/37, en este caso es 18/37(1+1/30).
Queremos hacer una simulación Montecarlo para poder predecir nuestras
ganancias y su desviación típica en función del número de jugadas que
hagamos en la ruleta. De este modo, esperamos que si jugamos más veces
al rojo podamos obtener mayores beneficios.

Una simulación Montecarlo reproduce un experimento en el ordenador un
gran número de veces, infinitas desde el punto de vista estadístico.
Una vez se tienen todos los resultados de los experimentos se pueden
hacer estadísticas de los resultados para obtener el resultado más
probable. Este método, que ha ganado popularidad a medida que los
ordenadores se han hecho más potentes, es muy útil cuando el sistema a
simular tiene un gran número de grados de libertad.

Lo que haremos entonces es jugar una cantidad muy grande de partidas
de ruleta en la que apostaremos una vez tras otra una cantidad fija al
rojo. No sólo calcularemos muchas partidas, en este caso 1000, sino
que estas partidas serán muy largas, de unas 10000 apuestas.  Si
intentáramos guardar todos los resultados en memoria para hacer
estadísticas necesitaríamos aproximadamente unos 100 MB de memoria. No
es demasiado para los ordenadores modernos pero si nos la podemos
aprovechar mucho mejor.

.. literalinclude:: _static/ruleta.m
   :language: matlab

El paso siguiente es representar gráficamente la media y la desviación
típica acumulada de todos los "disparos" de la simulación Montecarlo
para llegar a un valor asintótico

.. code-block:: matlab

   >> [avret,stdret] = ruleta(1/30,10000,1000,1);
   >> plot(1:10000,avret,'linewidth',2,1:10000,stdret,'linewidth',2)
   >> xlabel('N de apuestas al rojo')
   >> ylabel('Retorno [cantidad apostada]')
   >> legend('media','\sigma')


.. only:: latex

   .. figure:: _static/ruleta.pdf
      :align: center
      :scale: 70

      Media y desviación típica en función del tiempo de juego

.. only:: html

   .. figure:: _static/ruleta.png
      :align: center
      :scale: 100

      Media y desviación típica en función del tiempo de juego.

Como se puede ver en la figura, al cabo de 10000 apuestas en la ruleta
defectuosa hemos conseguido unas 45 veces la cantidad apostada cada
vez. Pero aunque las estadísticas con 1000 disparos con el método
Montecarlo parezcan muy dóciles la realidad es un poco más
complicada. Si nos fijamos en la desviación típica su valor es de 100
veces la cantidad apostada, lo que siginfica que las cantidades
ganadas o perdidas en cada juego individual presentan enormes
fluctuaciones.

De hecho es difícil ganar grandes cantidades de dinero de esta manera
incluso conociendo los defectos de las ruletas. Para mejorar el
rendimiento se suelen aplicar esquemas de decisión que incorporan la
posible existencia de grandes fluctuaciones sobre la media y que se
aprovechan de ellas.

Funciones de densidad de probabilidad conocidas
-----------------------------------------------

Siendo rigurosos el histograma da toda la información que necesitamos
sobre nuestros datos pero para tomar hipótesis sobre los mismos el
paso siguiente suele ser encontrar alguna función de densidad de
probabilidad conocida que se ajuste bien.  La más habitual cuando el
histograma parece simétrico es la distribución Normal o de Gauss.

.. function:: normpdf(x,mu,sigma)

  Calcula el valor de la función densidad de probabilidad en *x* dados
  la media *mu*, :math:`\mu` y la desviación típica *sigma*,
  :math:`\sigma`.

  .. math::

    p(x;\mu,\sigma) = \frac{1}{\sigma
    \sqrt{2\pi}}\exp\left(\frac{-(x-\mu)^2}{2\sigma^2} \right)

El paso siguiente en nuestro análisis de las acciones de Google puede
ser comparar los diferenciales de las sesiones con la distribución
normal.  Para ello aprovecharemos que ya hemos calculado la FDP de
nuestrso datos y la representaremos junto con la normal.

.. code-block:: matlab

  plot(bins,pdf,bins,normpdf(bins,mu,sig));
  xlabel('Diferenciales')
  ylabel('Probabilidad')
  legend('Histograma','Normal');

.. only:: latex

   .. figure:: _static/histnorm.pdf
      :align: center
      :scale: 70

      Comparación con la FDP Normal

.. only:: html

   .. figure:: _static/histnorm.png
      :align: center
      :scale: 100

      Comparación con la FDP Normal

Hay dos maneras de acceder a las funciones densisdad de probabilidad,
cada una tiene su propia función terminada en pdf, como ``betapdf`` o
``lognpdf`` pero podemos utilizarlas todas con la función ``pdf``.

.. function:: pdf(nombre,x,a,b,c)

  Calcula el valor de la FDP de nombre *nombre* en el punto *x*.  El
  número de parámetros necesarios para realizar el cálculo depende de
  la FDP.  Por ejemplo, si *nombre* es ``'norm'`` tendremos que
  proporcionar dos parámetros, si es ``'t'`` para la distribución t de
  Student bastará con un parámetro.

Ejercicio de Síntesis
---------------------

Existe un fenómeno físico importante en los sistemas no lineales
llamado *intermitencia*.  En los fenónemos que muestran intermitencia
observamos fluctuaciones mayores cuando separamos nuestros puntos de
toma de datos ya sea en el espacio como en el tiempo. Esta propiedad
es importante en el estudio de campos como la Turbulencia o en el
Análisis Financiero.

Cuanto más intermitente es un sistema más difícil se hace predecir el
valor de la variable a largo plazo.  Por este motivo se dice que los
valores que en un mercado muestran una gran intermitencia entrañan
también un gran riesgo.

Este ejercicio pretende también demostrar que predecir el valor de un
producto financiero a tiempos mayores a un mes es prácticamente
imposible si únicamente se tiene información sobre su valor.  Para
comprender mejor este ejercicio necesitamos conocer el concepto de
"cola ancha" o "fat tail".

Si hacemos el test :math:`\chi^2` a los diferenciales obtendremos, con
un margen de error minúsculo, que los datos se ajustan a una
distribución normal.  Sin embargo cualquier iniciado en Análisis
Financiero sabe perfectamente que asumir que estos datos se ajustan a
una distribución normal es algo cercano a un suicidio.  La diferencia
entre las dos FDP no se encuentra tanto en el los valores centrales
sino en las colas.  Es algo que se aprecia mucho mejor si, en vez de
representar las FDP del modo convencional, utilizamos una gráfica
semilogarítmica.

.. only:: latex

   .. figure:: _static/colas.pdf
      :align: center
      :scale: 70

      Comparación de las colas de la FDP

.. only:: html

   .. figure:: _static/colas.png
      :align: center
      :scale: 100

      Comparación de las colas de la FDP

Lo que vemos es que, aunque las dos FDP parezcan parecidas, su
comportamiento lejos de los valores centrales es completamente
distinto.  Mientras la Normal se va rápidamente a valores muy
pequeños, nuestra FDP parece no seguir la misma tendencia. *Este
comportamiento es muy importante porque implica que la probabilidad de
sucesos extremos es relevante*.  Este fenómeno, asociado a la
intermitencia, se conoce como *cola ancha* o *fat tail* e implica que
se corre un gran riesgo asumiendo que el siguiente valor va a ser
cercano a la media.

Para comprobar el efecto de la intermitencia representaremos la
gráfica logarítmica de distintos histogramas en los que calcularemos
el diferencial el mismo día y con 1, 4 y 9 días de diferencia.  Para
ello nos crearemos la función *tailcheck*

.. literalinclude:: _static/tailcheck.m
   :language: matlab

.. literalinclude:: _static/maintailcheck.m
   :language: matlab

.. only:: latex

   .. figure:: _static/fattail.pdf
      :align: center
      :scale: 70

      Colas anchas debidas a la intermitencia

.. only:: html

   .. figure:: _static/fattail.png
      :align: center
      :scale: 100

      Colas anchas debidas a la intermitencia

Como se ve claramente, a medida que separamos el tiempo entre los
diferenciales la probabilidad de obtener un valor más lejano de la
media crece significativamente a la vez que desciende la probabilidad
de lo contrario.  El fenómeno de *fat tail* crecería indefinidamente
acercándose al suceso puramente aleatorio en un caso límite.

Ejercicio propuesto
-------------------

Calcular y representar los caminos de un grupo de partículas con
movimiento aleatorio confinadas por un par de barreras :math:`B^{+}` y
:math:`B^{-}` unidades del orígen que es desde donde salen las
partículas.  Un movimiento aleatorio se calcula mediante la fórmula

.. math::
  x_{j+1}=x_{j}+s 

donde *s* es el número obtenido de una distribución normal
estandarizada de números aleatorios según la función ``randn``

Se cambiarán las condiciones de contorno de la siguiente manera:

#. Reflexión. Cuando una partícula se encuentre fuera de la frontera
   se devolverá al interior del dominio como si hubiera rebotado en una
   pared

#. Absorción. La partícula muere cuando entra en contacto con la
   pared.

#. Absorción parcial. Es la combinación de los dos casos previos.
   La partícula rebota en la pared y la perfección de la colisión
   depende de una determinada distribución de probabilidad.

Calcular una serie relevante de trayectorias y calcular:

#. La posición media de las partículas en función del tiempo.
  
#. La desviación típica de las posiciones de las partículas en
   función del tiempo.
  
#. ¿Influyen las condiciones de contorno en las distribuciones?
  
#. Para los casos de absorción y absorción parcial representar
   gráficamente el número de partículas supervivientes en función del
   número de saltos temporales.

Análisis de Datos
-----------------

