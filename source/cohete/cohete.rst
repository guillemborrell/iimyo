Mandar un cohete al espacio
===========================

La ecuación fundamental del movimiento vertical de un vehículo con
motor cohete es la tercera ley de Newton

.. math::

   E - D - mg = \frac{d}{dt}(m \dot h)

Esto es, el empuje menos la fuerza de rozamiento y la gravedad es
igual a la variación de la cantidad de movimiento.  Reescribiendo
ligeramente esta ecuación llegamos a que

.. math::

   E-D = \dot m \dot h + \left( m_0 - \int_0^t \dot m \ dt \right )
   (\ddot h + g)

Es la ecuación que relaciona las fuerzas externas con la velocidad la
aceleración y el gasto másico de combustible que abandona el cohete.
Esta fórmula es válida para cualquier motor cohete ha sea de
propulsante sólido o líquido.

La resistencia aerodinámica se define mediante el coeficiente de
resistencia :math:`c_d`

.. math::

   D = \frac{1}{2} \rho {\dot h}^2 S_f c_d

donde se conoce que el coeficiente de resistencia en vuelo puramente
vertical es igual a la resistencia parásita que puede ser aproximada
por esta función:

.. math::

   c_d = 2.6M^{1.1}\exp(-M)+0.3\sqrt{M}

Luego el empuje se define mediante la expresión siguiente

.. math::

   E = p_c A_g \Gamma(\gamma) \sqrt{\frac{2 \gamma}{\gamma-1} \left[
   1- \left( \frac{p_s}{p_c} \right)^{\frac{\gamma-1}{\gamma} }
   \right]}+\frac{A_s}{A_g}\left( \frac{p_s}{p_c}-\frac{p_a}{p_c}
   \right)

La relación de presiones en la tobera para flujo no desprendido
depende únicamente de la relación de áreas entre el área de la
garganta y el área de salida

.. math::

   \frac{A_s}{A_g} = \frac{\Gamma(\gamma)}{
   \frac{p_s}{p_c}^{\frac{1}{\gamma}}} \sqrt{\frac{2
   \gamma}{\gamma-1} \left[ 1- \left( \frac{p_s}{p_c}
   \right)^{\frac{\gamma-1}{\gamma}} \right]}

A su vez, el gasto másico del cohete se obtiene de la expresión de la
velocidad de recesión de un combustible sólido dada por la siguiente
fórmula

.. math::

   \dot r = kp_c^{0.7}

Sabiendo además que la velocidad de recesión a una presión de 50
atmósferas es de 1 centímetro por segundo. Suponiendo además que el
combustible se quema frontalmente y que la superficie quemada es
aproximadamente la superficie frontal del cohete se llega a la
siguiente expresión para el gasto másico:

.. math::

   \dot m = \rho_c S_f k p_c^{0.7}

Se realizarán las siguientes hipótesis adicionales:

* El cohete asciende de modo completamente vertical por una atmósfera
  estándar.

* La presión en la cámara de combustión se mantiene constante e igual
  a 5 MPa.

* El área de la garganta será de 0.01 :math:`m^2` y el área de salida
  será igual al área frontal del cohete.

* En un instante inicial el cohete se encuentra posado en el suelo a
  nivel del mar y con el motor encendido a régimen estacionario con la
  presión de cámara de combustión igual a la de diseño.

* La masa inicial del cohete es de 55 kg de los cuales 50 corresponden
  al combustible.

* La densidad del combustible sólido es de 1800 :math:`kg/m^3`.

Representar en función del tiempo la altura, la velocidad y la
aceleración del cohete en su ascensión hasta que se termina el
combustible para áreas frontales de 0.4, 0.6 y 0.8 :math:`m^2`

Fórmulas adiacionales
---------------------

Se define la atmósfera ISA con las siguientes fórmulas

* Gradiente térmico :math:`\lambda = -6.5\cdot 10^{-3} \frac{K}{m}`

* Temperatura a nivel del mar :math:`T_0 = 288K`

* Presión a nivel del mar :math:`p_0 = 101325 Pa`

* Densidad a nivel del mar :math:`\rho_0 = 1.225\frac{kg}{m^3}`

* La constante de los gases perfectos para el aire es 
  :math:`R=287 \frac{J}{kg K}`


.. math::

   T(h) = T_0 + \lambda h

.. math::

   p(h) = p_0\left( \frac{T_0+\lambda h}{T_0}
   \right)^\frac{g}{R\lambda}

.. math::

   \rho(h) = \rho_0 \left( \frac{T_0+\lambda h}{T_0}
   \right)^{\frac{g}{R\lambda}-1}

La constante necesaria para calcular las relaciones de presión
alrededor de toberas bloqueadas en régimen isentrópico es

.. math::

   \Gamma(\gamma) = \sqrt{\gamma} \left(
   \frac{2}{\gamma+1}\right)^\frac{\gamma+1}{2(\gamma-1)}

con :math:`\gamma` siempre igual a 1.4
