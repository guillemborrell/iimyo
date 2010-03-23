La ecuación de Burgers.
=======================

Este ejercicio tiene una finalidad puramente didáctica.  Veremos
algunas de las particularidades de los métodos pseudoespectrales para
la resolución de ecuaciones en derivadas parciales en dominios
periódicos.  El uso de un método espectral, de formulación mucho más
complicada, se justifica por ser mucho más rápido.  Aunque parezca
sorprendente la transformada rápida de Fourier o FFT (por sus siglas
en inglés Fast Fourier Transform) es una operación especialmente
eficiente en términos computacionales.  En este primer ejemplo, en el
que se resuelve una ecuación con términos de convección y difusión con
un método explícito, no se hacen evidentes las ventajas.  Se hacen
obvias cuando, resolviendo las ecuaciones de Navier Stokes en dominios
bidimensionales o tridimensionales, se usan métodos de integración
temporal un poco más sofisticados.

He aquí la ecuación de Burgers

.. math::
   :label: burgers

   \partial_t u + u \cdot \nabla u = \nu \nabla^2 u

En una dimensión

.. math::
   :label: burgers1d

   u_t  = \nu u_{xx} - u u_x

La ecuación se esquematiza de la siguiente manera

.. math::
   :label: esquemaburgers

   \partial_t u = L(u) - D(u)

Como el dominio es periódico podemos suponer que la forma de la
solución es :math:`u = \hat u \exp(ikx)`. que es equivalente a plantear
la ecuación para el espectro de la velocidad, su transformada de
Fourier.

.. math::
   :label: burgerse

   \partial_t \hat u = L(\hat u) - D(\hat u)

En este caso, la forma del operador lineal es

.. math::
   :label: L

   L(\hat u) = -k^2 \nu \hat u

Es obvio que sin el término no lineal la resolución de la EDO sería
trivial.  Bastaría con transformar la condición inicial al espacio de
frecuencias e integrar sobre él.

No existe ninguna manera exacta de convertir la operación :math:`u
u_t` en un operador :math:`D(\hat u)`, este cálculo debe realizarse en
el espacio real.  Para cada paso temporal será necesario
antitransformar la solución, calcular el operador :math:`D(u)`,
transformarlo y sumarlo en el espacio de frecuencias.

.. note::

   Podemos pensar que realizar dos transformadas de Fourier y
   multiplicar dos vectores es poco rentable.  Nada más lejos de la
   realidad.  La FFT necesita del orden de :math:`N \log N`
   operaciones.  Para que este número sea significativo podemos
   compararlo con resolver un sistema de ecuaciones lineales que
   necesita :math:`N^2` operaciones o invertir una matriz, que
   requiere :math:`N^3`.

La ecuación de Burgers nos reserva un fenómeno no esperado: el
aliasing. Cuando un operador diferencial es lineal no se mezcla el
espectro de ninguna manera.  Por ejemplo, el operador derivada segunda
:math:`\partial_{xx} \hat u = -k_x^2 \hat u` no introduce ninguna
operación entre cada uno de las componentes de :math:`\hat u`; lo
mismo sucede con los filtros proporcionales como el pasa-altos o el
pasa-bajos. El operador :math:`D(\hat u)` no es lineal e introducirá
aliasing en :math:`\hat u`.

Aliasing
--------

Para entender mejor el aliasing como fenómeno podemos tomar una única
onda simple para la variable :math:`u=\sin(\phi)` con, obviamente,
:math:`\phi=[0,2\pi]`. Su derivada en función de la coordenada
espacial será :math:`u_\phi=\cos(\phi)`, entonces el término no lineal
será :math:`u_\phi u = \cos(\phi) \sin(\phi)`.


.. only:: latex

   .. figure:: aliasing.pdf
      :align: center
      :scale: 100

      Demostración de la creación de armónicos superiores

.. only:: html

   .. figure:: aliasing.png
      :align: center
      :scale: 100

      Demostración de la creación de armónicos superiores

Como se ve en la figura, el término no lineal genera armónicos
superiores hasta el número de onda :math:`2k_N` que simplemente no
se distinguen si no se les da suficiente espacio en el espectro.  Que
no se distingan no significa que no aparezcan, lo que sucede es que se
mezclan con los números de onda superiores, dicha mezcla recibe el
nombre en inglés de *aliasing*.

El fenómeno se percibe mucho mejor si representamos el espectro de
alguna función un poco más compleja aunque simétrica, para que todos
los coeficientes de la transformada sean reales.
