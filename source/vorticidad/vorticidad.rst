Turbulencia bidimensional
=========================

.. note::

   Este ejercicio requiere conocimientos bastante específicos de
   Mecánica de Fluidos y Métodos Numéricos así que se puede considerar
   sólo aptos para lectores avanzados.

El objetivo de este ejemplo no es aprender turbulencia sino plantear
un problema numéricamente mucho más complicado.  El objetivo de este
texto es ir aumentando la dificultad de los ejemplos para que pueda
servir de soporte incluso para quien accede a Matlab como desafío
intelectual.

He tenido la gran suerte de coincidir con Javier Jiménez Sendín. Un
absoluto genio gracias al que he aprendido lo poco que se sobre
turbulencia. Publicó los apuntes de su curso en la École Polytechnique
en la página web del departamento [JIM]_ y espero que algún día se
conviertan en *el libro* de turbulencia en pared. Muchas de las ideas
que se plantean en esta introducción no son más que una introducción
de lo que se cuenta en estos apuntes.

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
   \frac{-\Delta p}{\rho} \int_{\partial \Omega} u dS = \nu
   \int_\Omega \nabla^2 K dV

El único modo en el que un término como

.. math:: 

   \epsilon = \nu \int_\Omega \nabla^2 K dV

sea independiente de la viscosidad es que su valor no se anule cuando
la viscosidad :math:`\nu` tienda a cero.  La única opción es que para
un fluido turbulento

.. math::

   \lim_{\nu \rightarrow 0} \int_\Omega \nabla^2 K dV = \infty

O lo que es lo mismo, que existan variaciones infinitas en la
distribución espacial de energía cinética.  Que dos puntos
infinitamente cercanos tengan velocidades distintas implica que el
campo de velocidades no es derivable y por lo tanto es un fractal.

La turbulencia es un ejemplo de caos.  El parámetro que distingue si
un fluido se comporta de modo caótico o ordenado es precisamente el
número de Reynolds.  Cuando el campo fluido es ordenado se llama
*laminar*, en caso contrario se llama *turbulento*, como era de
esperar.

Entender la Mecánica de Fluidos implica entender la Turbulencia y no
es precisamente algo simple.  En muchos casos, aunque la turbulencia
existe, no influye decisivamente en el resultado.  Los cálculos en
aerodinámica ignoran su existencia y se consigue predecir la
sustentación de un avión con una precisión razonable.  Pero a medida
que se busca una precisión mayor en los cálculos incluir la influencia
de las zonas en las que existe turbulencia se hace imprescindible.

Aquí llega otro inconveniente más. ¿Cuál es el coste de simular la
turbulencia? La respuesta implica conocer cuáles son las escalas más
pequeñas que son relevantes, el salto temporal de cada resultado y el
tiempo físico que se debe simular.  El orden de magnitud del número de
operaciones necesarias es de :math:`O(Re^3)` y el número de variables
a almacenar es de :math:`O(Re^{9/4}`, incluso para números de
Reynolds moderados esto significa un gasto enorme.  Pongamos como
ejemplo el flujo en una tubería de diámetro 0.1 metros, en la que
circula aire a una velocidad de 1 metro por segundo.  El número de
Reynolds de este movimiento es de

.. math::

   Re = \frac{UD}{\nu} \sim \frac{0.1 \times 1}{10^{-5}} = 10^4

Esto significa que el número de operaciones será del orden de
:math:`10^12` (tera) y el número de variables de :math:`10^9`
(giga). Este problema está dentro de las posibilidades de los
ordenadores modernos pero tiene poca utilidad industrial.  Fijémonos
ahora en el fluido alrededor de un coche de fórmula uno que mide
aproximadamente dos metros y va a 300 kilómetros por hora.  El número
de Reynolds del movimiento será de :math:`\sim 10^7`, el número de
variables de :math:`10^15` (peta) y el número de operaciones de
:math:`10^21` (?).  Intentar resolver un problema como este por fuerza
bruta no parece una buena idea.

Los esfuerzos actuales van dirigidos a comprender la turbulencia para
buscar un modelo capaz de reducir significativamente el coste
computacional del problema. Estos modelos se aplican ya a problemas
industriales pero no son infalibles.  Para hacerlos mejores se
necesita tener mejores simulaciones para realizar mejores hipótesis y,
como ha hemos demostrado, la Mecánica de Fluidos Computacional puede
implicar un esfuerzo enorme.



.. [JIM] Turbulence and Vortex Dynamics.  J. Jiménez
  Sendín. http://torroja.dmt.upm.es/~jimenez/

.. [HAG]  Über den Einfluss der Temperatur auf die Bewegung des
  Wassers in Röhren; G. Hägen; Math. Abh. Akad. Wiss. Berlin; 17-98;
  1854
 
.. [DAR]  Recherches expérimentales relatives au mouvement de l'eau
  dans les tuyaux; H. Darcy;  Mallet-Bachelier. Paris; 1857
