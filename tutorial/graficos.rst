Representación Gráfica
======================

La representación de cualquier serie de datos es uno de los puntos
fuertes de Matlab.  Dispone de funciones para representar series de
puntos, superfícies, curvas de nivel... Prácticamente cualquier cosa
puede representarse gráficamente en Matlab aunque aquí nos centraremos
en los comandos más simples

Curvas en el plano
------------------

La necesidad más simple de la representación gráfica es disponer de
dos series de datos *x* e *y* y representar en el plano la serie de
datos siendo *x* la coordenada del eje de abcisas e *y* la coordenada
del eje de ordenadas.  Esta operación se lleva a cabo mediante la
función ``plot`` independientemente de la complejidad de los datos.

.. function:: plot(...)

   Representa series de datos en el plano. Las posibilidades de uso de
   esta función son infinitas y la ayuda, que no se reproducirá aquí,
   es de las más extensas del lenguaje.

Para que nos hagamos una idea aproximada de la potencia del comando
plot sirvan estos tres ejemplos.

.. code-block:: matlab

   >> plot([1,2,3,2,1]);

.. only:: latex

   .. figure:: _static/simpleplot.pdf
      :align: center
      :scale: 70

      Figura generada por el comando anterior

.. only:: html

   .. figure:: _static/simpleplot.png
      :align: center
      :scale: 100

      Figura generada por el comando anterior

.. code-block:: matlab

   >> x = linspace(-pi,pi,64);
   >> plot(x,sin(x))

.. only:: latex

   .. figure:: _static/sinplot.pdf
      :align: center
      :scale: 70

      Figura generada por el comando anterior

.. only:: html

   .. figure:: _static/sinplot.png
      :align: center
      :scale: 100

      Figura generada por el comando anterior

.. code-block:: matlab

   >> x = linspace(-pi,pi,64);
   >> plot(x,sin(x),'ro','markersize',5)

.. only:: latex

   .. figure:: _static/sinplot_dots.pdf
      :align: center
      :scale: 70

      Figura generada por el comando anterior

.. only:: html

   .. figure:: _static/sinplot_dots.png
      :align: center
      :scale: 100

      Figura generada por el comando anterior


El comando plot puede recibir una cantidad infinita de argumentos pero
debemos agruparlos de una manera característica.  Los dos primeros
argumentos serán siempre datos, ya sean vectores o matrices. El tercer
argumento será una cadena de dos caracteres con una letra, designando
el color, y un símbolo, designando el tipo de línea o marcador.
Seguidamente se pueden modificar los atributos tales como el grosor de
la línea, el tamaño del marcador...  Una vez terminado un grupo se
puede empezar otra vez con dos argumentos con datos y así
indefinidamente.

Figura activa
-------------

Lo más importante de representar gráficos en Matlab es el concepto de
figura activa.  Matlab puede tener abiertas centenares de ventanas al
mismo tiempo pero sólo podrá representar datos en una: la figura
activa. Podemos controlar dicha figura mediante el comando ``figure``

.. function:: figure(n)

   Comando que crea una nueva figura o selecciona como activa la
   figura dada.  Cada figura tiene asignada un número entero, si *n*
   es una figura no existente creará una nueva y la activará, si *n*
   existe activará la figura correspondiente.

Otra consideración importante es que cada vez que representemos datos
en la figura activa todo lo que esté ya en ella se va a borrar.  Este
comportamiento no es el deseado en muchos casos y puede modificarse
mediante el comando hold

.. index:: hold

.. describe:: hold

   Cambia el comportamiento de la ventana activa.  Funciona como un
   interruptor: ``hold on`` hace que cada dato se represente sobre lo
   anterior y ``hold of`` borra la ventana antes de pintar en ella.
   Por omisión se encuentra en ``off``.

.. index:: clf

Un comando bastante útil es ``clf``, que borra la figura activa.

Etiquetas
---------

El paso siguiente es poner etiquetas: un identificador para cada eje y
un título si lo creemos necesario. Las etiquetas se aplicarán, tal
como se ha justificado en la sección anterior, sólo en la ventana
activa.

.. function:: title(str)

   Añade un título a la figura activa

.. function:: xlabel(str)

   Añade una etiqueta al eje *x* de la ventana activa

.. function:: ylabel(str)

   Añade una etiqueta al eje *y* de la ventana activa

Por ejemplo

.. code-block:: matlab

   x = linspace(0,500,10000);
   plot(x,exp(-x/100).*sin(x));
   title('Una funcion cualquiera')
   xlabel('Tiempo')
   ylabel('Amplitud')

Con el código anterior se obtiene la siguiente figura:

.. only:: latex

   .. figure:: _static/labels.pdf
      :align: center
      :scale: 70

      Ejemplo de etiquetas

.. only:: html

   .. figure:: _static/labels.png
      :align: center
      :scale: 100

      Ejemplo de etiquetas

El paso siguiente es dotar a los gráficos con más de una curva de una
leyenda que las distinga.  Esto se consigue mediante la función
``legend``.

.. function:: legend(...)

   Al igual que con ``plot`` podemos utilizar esta función de
   múltiples maneras.  La más simple es pasarle como argumento tantas
   cadenas de caracteres como curvas hayamos representado y
   automáticamente asignará por orden cada curva al identificador.

Supongamos que queremos representar el seno hiperbólico y el coseno
hiperbólico y para distinguirlos no nos vale acordarnos que Matlab
siempre pinta la primera curva en azul y la segunda en verde.  Para
ello podemos hacer lo siguiente:

.. code-block:: matlab

   x = linspace(-pi,pi,100);
   plot(x,sinh(x),x,cosh(x));
   legend('seno hiperbolico','coseno hiperbolico');


.. only:: latex

   .. figure:: _static/legend.pdf
      :align: center
      :scale: 70

      Ejemplo de aplicación de la leyenda

.. only:: html

   .. figure:: _static/legend.png
      :align: center
      :scale: 100

      Ejemplo de aplicación de la leyenda


Otros comandos
--------------

No todas las curvas en el plano pueden representarse a partir del
comando ``plot`` por los ejes que utiliza.  En algunos casos nos vemos
obligados a utilizar otros sistemas de coordenadas o a cambiar las
referencias de los ejes.  Estas funciones nos pueden ser de utilidad.

.. function:: semilogx(...)

   Su uso y funcionamiento es idéntico al de la función ``plot``.
   Representa gráficamente una serie de puntos tomando logaritmos en
   el eje *x*.

.. function:: semilogy(...)

   Su uso y funcionamiento es idéntico al de la función
   ``plot``. Representa gráficamente una serie de puntos tomando
   logaritmos en el eje *y*.

.. function:: loglog(...)

   Su uso y funcionamiento es idéntico al de la función ``plot``.
   Representa gráficamente una serie de puntos tomando logaritmos en
   ambos ejes.

.. function:: polar(...)
   
   Su uso y funcionamiento es idéntico al de la función
   ``plot``. Representa gráficamente una serie de datos en coordenadas
   polares.  El primer argumento corresponde al ángulo respecto a la
   dirección principal :math:`\theta` y el segundo a la distancia
   respecto al centro de referencia :math:`\rho`.

Un ejemplo de uso de la función ``polar`` es el siguiente

.. code-block:: matlab

   >> x = linspace(-pi,pi,100);
   >> polar(x, cos(2.*x));

.. only:: latex

   .. figure:: _static/polar.pdf
      :align: center
      :scale: 70

      Ejemplo de gráfica en coordenadas polares

.. only:: html

   .. figure:: _static/polar.png
      :align: center
      :scale: 100

      Ejemplo de gráfica en coordenadas polares


Plot handles
------------

Cada comando cuya salida se expresa en una figura puede también
devolver un argumento llamado plot handle.  Utilicemos como ejemplo la
figura anterior.

.. code-block:: matlab

   >> x = linspace(-pi,pi,100);
   >> h = polar(x, cos(2.*x));
   
Entonces, a parte de representar la curva, `h` es una variable que
contiene toda la información correspondiente a la misma y dentro del
léxico de Matlab suele recibir el nombre de *handle*.  Con la función
``get`` podemos obtener toda la información del *handle* y mediante la
función ``set`` podemos cambiar sus propiedades según nuestras
necesidades.  Lo más interesante es que no sólo las curvas devuelven
un *handle*; todos los objetos gráficos, incluso los ejes o la propia
figura genera un *handle*.

.. function:: get(h)

   Función que obtiene las características de un *handle* gráfico, ya
   sea una curva, los ejes de la figura o la misma figura

.. function:: set(h,attr,val)

   Funcion que modifica las características de un *handle* gráfico, ya
   sea una curva, los ejes de la figura o la misma figura.  Los
   argumentos siempre son, por este orden:

   :h: El *handle*

   :attr: Un atributo válido del handle como cadena de caracteres

   :val: El nuevo valor del atributo.


En el caso de las curvas o de la propia figura es la propia función
(``plot``, ``semilogx`` o ``figure``) la que genera el *handle* pero
también podemos utilizar las funciones que devuelven *handles* como
argumentos de salida.

.. function:: gca()

   No necesita ningún argumento.  Devuelve el *handle* de los ejes de
   la figura activa.

.. function:: gcf()

   No necesita ningún argumento.  Devuelve el *handle* de la figura
   activa

Utilizamos algunos de estos comandos en el ejemplo siguiente:

.. literalinclude:: _static/piramide.m

.. only:: latex

   .. figure:: _static/piramide.pdf
      :align: center
      :scale: 70

      Ejemplo de uso de ``set``

.. only:: html

   .. figure:: _static/piramide.png
      :align: center
      :scale: 100

      Ejemplo de uso de ``set``

Subplots
--------

Representación de datos en el plano
-----------------------------------

Ejercicio de síntesis
---------------------

El objetivo de este ejercicio es volver al ejercicio de síntesis en el
que estudiábamos la convergencia de las series de Taylor.  Vimos que,
a medida que añadíamos términos a la serie esta se acercaba al valor
de la función en las cercanías del punto en el que se calculaba.  El
resultado al que llegamos era una serie de puntos que lo demostraba
para la función exponencial.

Aprovechando que ya disponemos de una función que genera las series
vamos a representar gráficamente la función junto con una serie de
desarrollos de Taylor con distinto orden.  Después representaremos el
error de la aproximación restando el desarrollo a la función y
finalmente el error en función del orden en dos puntos cercanos al
origen.


.. literalinclude:: _static/taylor.m
   :language: matlab

.. only:: latex

   .. figure:: _static/desarrollo.pdf
      :align: center
      :scale: 70

      La función exponencial y sus desarrollos de Taylor en el origen
      hasta orden 5.

.. only:: html

   .. figure:: _static/desarrollo.png
      :align: center
      :scale: 100

      La función exponencial y sus desarrollos de Taylor en el origen
      hasta orden 5.

.. only:: latex

   .. figure:: _static/error.pdf
      :align: center
      :scale: 70

      Error del desarrollo.  Los puntos son los valores en las abcisas
      x=0.1 y x=0.2 respectivamente

.. only:: html

   .. figure:: _static/error.png
      :align: center
      :scale: 100

      Error del desarrollo.  Los puntos son los valores en las abcisas
      x=0.1 y x=0.2 respectivamente

.. only:: latex

   .. figure:: _static/convergencia.pdf
      :align: center
      :scale: 70

      Convergencia en función del orden.

.. only:: html

   .. figure:: _static/convergencia.png
      :align: center
      :scale: 100

      Convergencia en función del orden.

