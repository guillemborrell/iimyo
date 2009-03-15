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
:math:`k = \frac{g}{\omega^2 a}` para el que el péndulo deja de ser
estable.

Representar gráficamente el movimiento de la partícula respecto al
tiempo adimensional :math:`\omega t = \tau \in [0,4\pi]` con *k* = 0.1
y *k* = 10. En todos los casos la longitud del péndulo será de 0.1
metro y la gravedad de 9.8 metros por segundo.

Solución
--------

El concepto subyacente en este ejercicio es la importancia de
adimensionalizar las ecuaciones.  No es momento de nombrar las
ventajas de utilizar el teorema :math:`\pi` pero sí podemos demostrar
que tras un poco de manipulación es sencillo llegar a conclusiones
simplemente echándole un vistazo a la expresión resultante.

Pero antes hay que adimensionaliar, para ello escogemos una longitud
característica :math:`a`, la amplitud del forzado y un tiempo
característico :math:`\omega^{-1}`.  La aceleración característica será
entonces :math:`a\omega^2`

Con todo lo anterior se define un tiempo adimensional :math:`\tau` y
una longitud adimensional :math:`\lambda`.  Adimensionalizando la
ecuación anterior e introduciendo la expresión del forzado se
obtienene la siguiente expresión

.. math::

   \lambda a \omega^2 \theta'' + a \omega^2 \sin \tau \sin \theta = g
   \sin \theta

Donde el operador :math:`'` significa la derivada respecto al tiempo
adimensional :math:`\tau`. Linealizando la ecuación para ángulos
pequeños

.. math::

   \lambda a \omega^2 \theta'' + (a \omega^2 \sin \tau) \theta = g
   \theta

Dividiendo ambos lados por :math:`a\omega^2`...

.. math::

   \lambda \theta'' + \left(\sin \tau -k \right) \theta = 0

En la que finalmente aparece el parámetro propuesto
:math:`k=\frac{g}{\omega^2 a}` que es el parámetro que relaciona la
aceleración debida a la gravedad con las aceleraciones debidas al forzado.

Con el simple hecho de adimensionalizar podemos comparar la
importancia del término derivada segunda respecto al término con
:math:`\theta` mediante el siguiente número adimensional
:math:`\Delta(\tau) = \frac{\sin \tau -k}{\lambda}`

.. math::

   \theta'' + \Delta(\tau) \theta = 0

Con este primer número adimensional podemos comprobar que la ecuación
diferencial se comportará de un modo u otro según su valor.  Si
:math:`\Delta(\tau)` es muy pequeño la ecuación resultante será

.. math::

   \theta'' = 0

Que tiene como solución :math:`\theta(\tau) = A\tau +B`, un
crecimiento lineal con el tiempo adimensional. Esto sucederá
justamente cuando el numerador de :math:`\Delta(\tau)` se haga cero,
esto es: :math:`\sin \tau -k = 0`. En cualquier otro instante la
solución será puramente armónica. Entonces parece razonable pensar que
si el numerador nunca se anula entonces el sistema será estable. Para
ello bastará que *k* sea mayor que 1 aunque como se verá a
continuación no es un límite estricto.

Para plantear la ecuación se hace el cambio de variable 
:math:`\dot \theta = u_2` y :math:`\theta = u_1` para poder expresar
la ecuación de segundo orden en forma de sistema de ecuaciones

.. math::

   \begin{array}{rl}
   \dot u_1 = & u_2\\
   \dot u_2 = & \frac{\sin \tau - k}{\lambda} u_1 
   \end{array}

Una solución al estudio del problema se presenta a continuación.

.. literalinclude:: fig/invpend.m
   :language: matlab



Bibliografía
------------

.. [#] Inverted Pendulum. Wikipedia. http://en.wikipedia.org/wiki/Inverted_pendulum .
