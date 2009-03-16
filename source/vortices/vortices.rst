Movimiento de vórtices puntuales
================================

Los fluidos en régimen incompresible no viscoso pueden describirse
mediante la ecuación de Laplace para el potencial de velocidades

.. math::

  \nabla^2 \phi = 0

En el caso bidimensional el problema analítico se simplifica
significativamente utilizando números complejos, de esta forma la
velocidad inducida por un vértice puntual es

.. math::

  w(z) = u - iv = \frac{\gamma}{2 \pi i (z-z_1)}

donde :math:`z = x + iy` es un punto en el plano complejo y
:math:`z_1` es la posición del vórtice en el mismo plano.  Si el
vórtice es puntual es arrastrado por la corriente como un elemento
pasivo sin masa.  Esto significa que si ponemos juntos dos vórtices la
velocidad de cada uno valdrá

.. math::

  z_1^\prime(z) = \frac{\gamma_2}{2 \pi i (z_1-z_2)}\\
  z_2^\prime(z) = \frac{\gamma_1}{2 \pi i (z_2-z_1)}

El movimiento de estos dos vórtices es fácil de resolver.  Si se sitúa
el primero en el punto (1,0) y el segundo en el (-1,0) como aparece en
la figura es sencillo demostrar que trazarán una circunferencia
alrededor del punto (0,0). El comportamiento de los vórtices será
independiente de la posición inicial, acercarlos o alejarlos hará que
giren más o menos deprisa pero no cambiará su trayectoria.  El
problema se complica en cuanto añadimos un tercer vórtice al
grupo. Excepto en algunos casos particulares un grupo de tres vórtices
tiene un movimiento caótico.

Dada una vorticidad :math:`\gamma=2\pi` idéntica para cada vórtice:

* Integrar el movimiento de tres vórtices situados en el plano
  complejo en los puntos (1,0), (-1,0) y (0, :math:`\sqrt{3}`)
  respectivamente.  Representar el resultado gráficamente para un
  intervalo de tiempo entre :math:`t \in [0,100]`

* Integrar el movimiento de tres vórtices situados en el plano
  complejo en los puntos (1,0), (-1,0) y (1,1) respectivamente.
  Representar el resultado gráficamente para un intervalo de tiempo
  entre :math:`t \in [0,100]`

.. note::

   Puede encontrarse una descripción mucho más detallada del problema
   en [JIM]_


.. [JIM]  Turbulence and Vortex Dynamics.  J. Jiménez Sendín. http://torroja.dmt.upm.es/~jimenez/
