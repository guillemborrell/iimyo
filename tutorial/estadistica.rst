Estadística Descriptiva
=======================

En este capítulo nos centraremos en los cálculos más básicos de la
Estadística Descriptiva y de los modelos de datos con Matlab. Esta
pequeña introducción no cuenta con una descripción teórica de los
cálculos así que se suponen conocimientos básicos de Estadística.

.. warning::

   Algunas de las funcionalidades más específicas para el tratamiento
   estadístico de datos con Matlab se encuentran en el Statistics
   Toolbox y deben adquirirse a parte.  En el caso de Octave podemos
   instalar el paquete extra de estadística de Octave-forge.

Distribuciones de frecuencias
-----------------------------

Cuando analizamos datos la primera pregunta que debemos hacernos es si
se ajustan a algún patrón.  Los datos pueden ser muy numerosos y estar
dispersos así que un ordenador nos puede ser de gran utilidad.
Detectar el patrón depende en gran medida de la complejidad de los
datos; no es lo mismo analizar cómo funciona una ruleta en un casino
que hacer lo mismo con un resultado electoral en Estados Unidos.

Supongamos que estamos ante una serie de datos como, por ejemplo, la
altura de los alumnos de sexo masculino de un instituto de
secundaria. El primer paso es obtener la distribución de frecuencias y
un histograma

.. literalinclude:: _static/altura.dat

para ello introduciremos los datos anteriores en un vector llamado
``altura`` y representaremos el histograma.

.. code-block:: matlab

   hist(altura,10,max(size(altura)))
   xlabel('Altura [m]')
   ylabel('Frecuencia')

.. only:: latex

   .. figure:: _static/histograma.pdf
      :align: center
      :scale: 70

      Histograma de la altura

.. only:: html

   .. figure:: _static/histograma.png
      :align: center
      :scale: 100

      Histograma de la altura


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

.. code-block:: matlab

   mean(altura)
   ans = 1.7380
   median(altura)
   ans = 1.7442

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
