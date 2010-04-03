Estadística Descriptiva
=======================

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

    \embedfile{../../_static/googopen.dat}
    \embedfile{../../_static/googclse.dat}


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

   s = \sqrt{\frac{1}{N-1}\sum_{i=1}^N(x_i - \bar x)^2 n_i}

.. function:: std(x,flag,dim)

   Calcula la desviación estándar de una muestra.  Si el argumento
   *flag* se omite o *flag* = 0 se utiliza la definción anterior de la
   desviación típica.  Si se introduce el valor de *flag* = 1 entonces
   se utiliza la definición anternativa de la desviación típica.

La definición alternativa es

.. math::

   \sigma = \sqrt{\frac{1}{N}\sum_{i=1}^N(x_i - \bar x)^2 n_i}

.. function:: var(x,flag,dim)

   Calcula la varianza de una muestra.  Es el cuadrado de la
   desviación típica.



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
