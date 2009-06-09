La ecuación de Burgers.
=======================

Este ejercicio tiene una finalidad puramente didáctica.  Veremos
algunas de las particularidades de los métodos pseudoespectrales para
la resolución de ecuaciones en derivadas parciales en dominios
periodicos. Visto de un modo aislado el ejercicio no tiene mucho
sentido porque la ecuación que resolveremos, la ecuación de Burgers,
no tiene demasiada relevancia desde un punto de vista físico.  Sin
embargo es un previo necesario al siguiente problema en el que se
resolverán las ecuaciones de Navier Stokes en un dominio
bidimensional.

He aquí la ecuación de Burgers

.. math::
   :label: burgers

   \partial_t u + u \cdot \nabla u = \nu \nabla^2 u

En una dimensión

.. math::
   :label: burgers1d

   u_t + u u_x = \nu u_{xx}

La ecuación se esquematiza de la siguiente manera

.. math::
   :label: esquemaburgers

   \partial_t u = L(u) - D(u)

El método para resolver esta ecuación para un dominio periódico es un
poco exótica.  En vez de plantear la ecuación para la velocidad lo
haremos para su espectro, su transformada de Fourier.

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
u_t` en un operador :math:`D(\hat u)`, esta operación debe realizarse
en el espacio real.  Para cada paso temporal será necesario
antitransformar la solución, calcular el operador :math:`D(u)`,
transformarlo y sumarlo en el espacio de frecuencias.

.. note::

   Podemos pensar que realizar dos transformadas de Fourier y
   multiplicar dos vectores es poco rentable.  Nada más lejos de la
   realidad.  La ...

El problema de operar en el espacio real es la aparición de un
fenómeno no esperado: el aliasing.

Supongamos que queremos
