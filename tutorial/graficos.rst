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




Ejercicio de síntesis
---------------------

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
