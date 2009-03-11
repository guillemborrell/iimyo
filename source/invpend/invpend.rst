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

El paso siguiente es suponer que el ángulo :math:`\theta` se mantiene
pequeño en cualquier instante.

Supuesto un movimiento armónico de la base del péndulo
:math:`y = a \sin \omega t`, obtener el valor del parámetro 
:math:`k = \frac{\omega^2 a}{g}` para el que el péndulo deja de ser
estable.

Representar gráficamente el movimiento de la partícula respecto al
tiempo adimensional :math:`\tau \in [0,20]` con *k* = 0.1 y *k*
= 10. En todos los casos la longitud del péndulo será de 0.1 metro y
la gravedad de 9.8 metros por segundo.

Solución
--------

El concepto subyacente en este ejercicio es la importancia de
adimensionalizar las ecuaciones.  No es momento de nombrar las
ventajas de utilizar el teorema :math:`\pi` pero sí podemos demostrar
que tras un poco de manipulación es sencillo llegar a conclusiones
simplemente echándole un vistazo a la expresión resultante.

Estamos delante de una ecuación diferencial no lineal así que la
discusión sobre su estabilidad no puede hacerse simplemente calculando
un par de autovalores. Gracias al cálculo numérico podemos buscar la
solución al problema mediante la fuerza bruta.  El punto de transición
puede considerarse como un cero de una función.  Si el cero es el
punto en el que el valor de la función pasa de positivo a negativo un
punto de transición significa el cambio de estable a inestable.
Entonces cualquier método numérico para hallar un cero servirá para
hallar el punto de transición.

Pero antes hay que adimensionaliar, para ello escogemos una longitud
característica :math:`a`, la amplitud del forzado y un tiempo
característico :math:`\omega^-1`.  La aceleración característica será
entonces :math:`a\omega^2`

.. math::

   \frac{l}{a \omega^2}  \ddot \theta - \frac{1}{a \omega^2}\ddot y
   \sin \theta = \frac{g}{a \omega^2} \sin \theta

Linealizando la ecuación para ángulos pequeños

.. math::

   \frac{l}{a \omega^2}  \ddot \theta - \frac{1}{a \omega^2}\ddot y
   \theta = \frac{g}{a \omega^2} \theta

Y aplicando la definición del forzado :math:`y`

.. math::

   \frac{l}{a \omega^2} \ddot \theta + \theta \sin \tau = \frac{g}{a
   \omega^2} \theta

Multiplicando ambos lados por :math:`a\omega^2` y dividiendo por
:math:`g` se llega a la siguiente expresión

.. math::

   \frac{l}{g} \ddot \theta + \theta \left(k \sin \tau  \right-1) = 0

En la que finalmente aparece el parámetro propuesto
:math:`k=\frac{\omega^2 a}{g}` que tiene un significado físico
bastante claro, es el parámetro que relaciona las fuerzas debidas a la
inercia de la masa con las debidas a la acción de la gravedad.  Es
obvio que la fuerza de la gravedad es la que provoca que el péndulo
caiga y por lo tanto es la causa de la inestabilidad.  Si las
aceleraciones debidas a la inercia son mucho mayores que la gravedad
esta puede despreciarse con lo que el sistema podría ser estable.
Esto significa que si el sistema es estable en alguna condición lo
será para :math:`k>>1`.  Esto permite estimar que un buen lugar para
buscar el punto de transición es entre *k* = 10 y *k* = 100.

Para plantear la ecuación se hace el cambio de variable 
:math:`\dot \theta = u_2` y :math:`\theta = u_1` para poder expresar
la ecuación de segundo orden en forma de sistema de ecuaciones

.. math::

   \begin{array}{rcl}
   \dot u_1 = u_2\\
   \dot u_2 = \frac{g}{l} u_1 (k \sin \tau -1)
   \end{array}



Bibliografía
------------

.. [#] Inverted Pendulum. Wikipedia. http://en.wikipedia.org/wiki/Inverted_pendulum .
