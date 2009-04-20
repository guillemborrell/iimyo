Ejemplo. La atmósfera estándar (ISA)
------------------------------------

Una de las simplificaciones más sencillas para tratar teóricamente las
capas más bajas de la atmósfera es suponer que es un gas perfecto en
reposo.  Esta simplificación, que no es demasiado adecuada en la zona
más cercana al suelo, sí es acertada en alturas de entre doscientos y
diez mil metros si se le añade la condición que existe una variación
exponencial de la temperatura con la altura.  Este modelo estático se
conoce como atmósfera estándar o atmósfera ISA.  Está gobernada por
las siguientes condiciones:

* Constantes

  * Gradiente térmico :math:`\lambda = -6.5\cdot 10^{-3} \frac{K}{m}`

  * Gravedad a nivel del mar :math:`g=9.81`

  * La constante de los gases perfectos para el aire es 
    :math:`R=287 \frac{J}{kg K}`

* Parámetros

  * Temperatura a nivel del mar :math:`T_0`

  * Presión a nivel del mar :math:`p_0`

.. math::

   T(h) = T_0 + \lambda h

.. math::

   p(h) = p_0\left( \frac{T_0+\lambda h}{T_0}
   \right)^\frac{g}{R\lambda}

.. math::

   \rho(h) = \rho_0 \left( \frac{T_0+\lambda h}{T_0}
   \right)^{\frac{g}{R\lambda}-1}

A estas ecuaciones hay que sumarle el modelo de gas perfecto.

La incógnita del problema es la altitud :math:`h`.  Siguiendo las dos
leyes, la atmósfera estándar podrá convertirse en un bloque
sustituyendo las constantes por su valor, recibiendo los parámetros y
tomando como argumentos de salida las funciones que tienen como
argumento la incógnita.  Una posible implementación sería la
siguiente:

.. literalinclude:: ISA.m
   :language: matlab

El bloque ``ISA`` crea las funciones correspondientes a la
temperatura, la presión y la densidad en función de la altitud.  Se
usa como se muestra a continuación

.. code-block:: matlab

  >> [T,p,rho]=ISA(298,101325);
  >> T(1500)

  ans =

    288.2500

  >> rho(1500)

  ans =

    1.0282
