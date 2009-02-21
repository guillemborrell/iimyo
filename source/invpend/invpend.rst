Estudio del péndulo invertido
=============================

Un péndulo es uno de los juguetes más básicos para experimentar los
conceptos de periodo y gravedad. ¿Qué sucede si la masa se une a una
barra rígida y se pone al revés?  Entonces se obtiene un péndulo
invertido, un sistema aparentemente inestable que es un ejemplo
clásico para el control automático.

.. latexonly::

   .. figure:: fig/Cart-pendulum.png
      :align: center
      :scale: 200

      Esquema de un péndulo invertido con movimiento horizontal.

.. htmlonly::

   .. figure:: fig/Cart-pendulum.png
      :align: center
      :scale: 70

      Esquema de un péndulo invertido con movimiento horizontal.
  
Una de las claves del péndulo invertido es intentar controlar el
movimiento de la masa moviendo el otro extremo de la barra.  En el
ejemplo del carrito se demuestra que la barra se puede mantener en
posición vertical para una perturbación dada lo suficientemente
pequeña.

Existe otra posibilidad, la de mantener la barra en posición vertical
moviendo la base del péndulo también con una trayectoria vertical como
se muestra en la figura siguiente:

.. latexonly::

   .. figure:: fig/Pendulum-osc.png
      :align: center
      :scale: 200

      Esquema de un péndulo invertido con movimiento vertical.

.. htmlonly::

   .. figure:: fig/Pendulum-osc.png
      :align: center
      :scale: 70

      Esquema de un péndulo invertido con movimiento vertical.

En este caso, la masa tiene la siguiente posición:

.. math::

   (l \sin \theta, y + l \cos \theta)

y la siguiente velocidad:

.. math::

   (l\dot\theta \cos \theta, \dot y + l \dot\theta \sin \theta)

La lagrangiana del sistema es entonces:

.. math::

   L = \frac{1}{2}m \left( \dot y^2 + 2 l \dot \theta \dot y \sin
   \theta + l^2 \dot \theta^2 \right) - mg (y + l \cos \theta)

Y la ecuación del movimiento:

.. math::

   l \ddot \theta - \ddot y \sin \theta = g \sin \theta

Supuesto un movimiento armónico de la base del péndulo
:math:`y = a \sin \omega t`, obtener el valor del parámetro 
:math:`k = \frac{\omega^2 a}{g}` para el que el péndulo deja de ser
estable.

Representar gráficamente el movimiento de la partícula respecto al
tiempo con *k* = 0.1 y *k* = 10.

Solución
--------

Hay una manera rápida y otra lenta de hacer el problema.  Curiosamente
no por ello significa que la rápida sea fácil y la lenta difícil o
viceversa, simplemente hay que tener algo de conocimientos sobre
estabilidad de sistemas físicos.

Bibliografía
------------

.. [#] Inverted Pendulum. Wikipedia. http://en.wikipedia.org/wiki/Inverted_pendulum .
