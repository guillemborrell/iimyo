Turbulencia bidimensional
=========================

.. note::

   Este ejercicio requiere conocimientos bastante específicos de
   Mecánica de Fluidos y Métodos Numéricos así que se puede considerar
   sólo aptos para lectores avanzados.

El objetivo de este ejemplo no es aprender turbulencia sino plantear
un problema numéricamente mucho más complicado.

He tenido la gran suerte de coincidir con Javier Jiménez Sendín. Un
absoluto genio gracias al que he aprendido lo poco que se sobre
Turbulencia. Publicó los apuntes de su curso en la École Polytechnique
en la página web del departamento [JIM]_ y espero que algún día se
conviertan en *el libro* de Turbulencia en pared. Muchas de las ideas
que se plantean en esta introducción no son más que una traducción de
lo que se cuenta en estos apuntes.

La turbulencia es un fenómeno que se presenta en los flujos a altos
números de Reynolds, esto es, cuando o bien la velocidad o las escalas
de longitud son moderadamente grandes.  La mayoría de los fenómenos
fluidodinámicos son turbulentos: el desagüe del lavabo, el interior de
un motor de coche, el aire alrededor de un avión en vuelo, el
corriente sanguíneo en la aorta... 

Quizás la mayor paradoja (que no es tal) del movimiento de un fluido a
altos números de Reynolds es que en estos casos la disipación de
energía es independiente de la viscosidad del líquido.  Este
descubrimiento, que debemos paralelamente a Hagen [HAG]_ y Darcy
[DAR]_ es comparable al que la velocidad de la luz no depende del
sistema de referencia. Si el segundo se explica gracias a la teoría
general de la relatividad, el primero impone la existencia de la
turbulencia.

¿Qué es la turbulencia entonces?  Si nos escribimos la ecuación de la
variación de la energía cinética de un fluido en función del tiempo
para un volumen dado y por unidad de masa:

.. math::

   \epsilon = \frac {\partial}{\partial t}\int_\Omega K dV =
   \frac{-\Delta p}{\rho} \int_{\partial \Omega} u\ dS = \nu
   \int_\Omega \nabla^2 K dV

El único modo en el que un término como

.. math:: 

   \epsilon = \nu \int_\Omega \nabla^2 K dV

es independiente de la viscosidad es que su valor no se anule cuando
la viscosidad :math:`\nu` tiende a cero.  La única opción es que para
un fluido turbulento

.. math::

   \lim_{\nu \rightarrow 0} \int_\Omega \nabla^2 K dV = \infty

O lo que es lo mismo, que existan variaciones infinitas en la
distribución espacial de energía cinética.  Que dos puntos
infinitamente cercanos tengan velocidades distintas implica que el
campo de velocidades no es derivable y por lo tanto es fractal.

La turbulencia es un ejemplo de caos.  El parámetro que distingue si
un fluido se comporta de modo caótico o ordenado es precisamente el
número de Reynolds.  Cuando el campo fluido es ordenado se llama
*laminar*, en caso contrario se llama *turbulento*, como era de
esperar.

Entender la Mecánica de Fluidos implica entender la Turbulencia y no
es precisamente algo simple.  En muchos casos, aunque la turbulencia
existe, no influye decisivamente en el resultado.  Los cálculos en
Aerodinámica ignoran su existencia y se consigue predecir la
sustentación de un avión con una precisión razonable.  Pero a medida
que se busca una precisión mayor incluir la influencia de las zonas en
las que existe turbulencia se hace imprescindible.

Aquí llega otro inconveniente más. ¿Cuál es el coste de simular la
turbulencia? La respuesta implica conocer cuáles son las escalas más
pequeñas que son relevantes, el salto temporal de cada resultado y el
tiempo físico que se debe simular.  El orden de magnitud del número de
operaciones necesarias es de :math:`O(Re^3)` y el número de variables
a almacenar es de :math:`O(Re^{9/4})`, incluso para números de
Reynolds moderados esto significa un gasto enorme.  Pongamos como
ejemplo el flujo en una tubería de diámetro 0.1 metros, en la que
circula aire a una velocidad de 1 metro por segundo.  El número de
Reynolds de este movimiento es de

.. math::

   Re = \frac{UD}{\nu} \sim \frac{0.1 \times 1}{10^{-5}} = 10^4

Esto significa que el número de operaciones será del orden de
:math:`10^{12}` (tera) y el número de variables de :math:`10^9`
(giga). Este problema está dentro de las posibilidades de los
ordenadores modernos pero tiene poca utilidad industrial.  Fijémonos
ahora en el aire alrededor de un coche de fórmula uno que mide
aproximadamente dos metros y va a 300 kilómetros por hora.  El número
de Reynolds del movimiento será de :math:`\sim 10^7`, el número de
variables de :math:`10^{15}` (peta) y el número de operaciones de
:math:`10^{21}` (zetta).  Intentar resolver un problema como este por
fuerza bruta no parece una buena idea.

Los esfuerzos actuales van dirigidos a comprender la turbulencia para
buscar un modelo capaz de reducir significativamente el coste
computacional del problema. Estos modelos se aplican ya a problemas
industriales pero no son infalibles.  Para hacerlos mejores se
necesita tener mejores simulaciones para realizar así mejores
hipótesis. Como ha hemos demostrado, la investigación en Turbulencia y
en Mecánica de Fluidos Computacional puede implicar un esfuerzo
enorme.

La turbulencia bidimensional no es exactamente turbulencia.  Si se
elimina la tercera dimensión desaparece el mecanismo por el que la
vorticidad se hace singular y el fluido se convierte en fractal.  En
dos dimensiones la vorticidad no tiene otro destino que disiparse y
morir. Sin embargo sí es útil para comprender los efectos de la
viscosidad en un fluido.

El objetivo de este ejercicio es simular un dominio infinito en el que
una distribución dada de velocidad en dos dimensiones evoluciona hasta
disiparse.  En este caso un dominio infinito será un cuadrado con
condiciones de contorno periodicas.  Estas condiciones de contorno
permiten utilizar un método pseudoespectral mucho menos exigente desde
un punto de vista computacional.

Cuando el dominio de cálculo es periódico se puede suponer que la
solución tiene la forma de su desarrollo en serie de Fourier y que su
tamaño, independientemente de sus dimensiones, será de 0 a :math:`2
\pi`

.. math::

   u = \sum_{k=0}^{N-1} \hat u_k \exp(ikx)

Si además el dominio se discretiza, con lo que :math:`x_j = 2\pi j/N`

.. math::

   u_j = \sum_{k=0}^{N-1} \hat u_k \exp \left(ik\frac{2 \pi j}{N}
   \right)

Planteamiento de las ecuaciones
-------------------------------

Las ecuaciones de Navier Stokes para un fluido incompresible y con
viscosidad constante son

.. math::
   :label: continuidad

   \nabla \cdot \vec u = 0

.. math::
   :label: cmov

   \partial_t \vec u + \vec u \cdot \nabla \vec u = - \rho^{-1} \nabla
   p + \nu \nabla^2 \vec u

El problema de intentar resolver estas ecuaciones es que implica
calcular tres incógnitas, :math:`u`, :math:`v` y :math:`p`.  La
solución es cambiar las incógnitas a dos que ya asuman que el fluido
es incompresible, la función de corriente :math:`\psi` y la vorticidad
:math:`\omega` definidas como sigue

.. math::

   \vec u = (\partial \psi / \partial y,- \partial \psi / \partial x )

.. math::

   \omega = \partial_x v - \partial_y u

Entonces el problema se reduce a dos ecuaciones escalares sin la presión.

.. math::
   :label: vorticidad

   \partial_t \omega + u \cdot \nabla \omega = \nu \nabla^2 \omega

.. math::
   :label: poisson
   
   \nabla^2 \psi = - \omega

Podemos reescribir la ecuación :eq:`vorticidad`, una vez
adimensionalizada, de la siguiente manera

.. math::
   :label: convecciondifusion

   \partial_t \omega + \partial_y \psi \partial_x \omega - \partial_x
   \psi \partial_y \omega = Re^{-1} \nabla^2 \omega

Puede esquematizarse como

.. math::
   :label: esquema

   \partial_t \omega = - D(\omega) + L(\omega)



.. [JIM] Turbulence and Vortex Dynamics.  J. Jiménez
  Sendín. http://torroja.dmt.upm.es/~jimenez/

.. [HAG]  Über den Einfluss der Temperatur auf die Bewegung des
  Wassers in Röhren; G. Hägen; Math. Abh. Akad. Wiss. Berlin; 17-98;
  1854
 
.. [DAR]  Recherches expérimentales relatives au mouvement de l'eau
  dans les tuyaux; H. Darcy;  Mallet-Bachelier. Paris; 1857
