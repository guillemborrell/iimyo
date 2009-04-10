Ejemplo. El saque de Andy Roddick
---------------------------------

La final de la Copa Davis de 2004 se jugó en Sevilla y enfrentó los
equipos de España y Estados Unidos.  La elección no estuvo exenta de
controversia puesto que la candidatura de Sevilla adujo contra la de
Madrid que al estar prácticamente a nivel del mar los jugadores
tendrían menos dificultades para restar el saque de Andy Roddick.
Hacer una simulación realmente precisa del problema para llegar a una
conclusión no es necesario puesto que con un poco de análisis
dimensional se llega a que el tiempo de vuelo de la pelota es
proporcional a la densidad pero para demostrar toda la teoría de
diseño de aplicaciones resolveremos el problema completo.

Supongamos que el equipo español de copa Davis quiere saber la
diferencia del tiempo de vuelo entre servicio y resto en función de la
altura a la que se juegue el partido. Para ello nos pide un estudio
pormenorizado en el que se tendrán en cuenta factores como:

* Las características de la atmósfera.

* El desprendimiento de la capa límite alrededor de la bola.

* La velocidad y dirección inicial de la bola sin efectos.

Finalmente nos definen el tiempo de vuelo como el tiempo que
transcurre desde el impacto con la raqueta hasta que cruza la vertical
del final de la pista en el lado del resto después de un bote
completamente elástico en el cuadro de saque. Estiman también que un
saque de Andy puede llegar a los 200 kilómetros por hora.

Este problema nos servirá no sólo para ejemplificar el significado de
las dos leyes, también será un ejemplo sobre cómo debe afrontarse el
problema de simular un sistema físico.  Esta recomendación es válida
en prácticamente cualquier ocasión y puede tomarse como una tercera
ley: *siempre hay que adimensinalizar todas las ecuaciones*.

Empezamos planteando la tercera ley de Newton:

.. math::

   \sum \vec F = m \ddot \vec x

que para cada una de sus componentes será

.. math::

   \begin{array}{rl}
   m \ddot x = &  -D \cos \theta\\
   m \ddot y = &  -mg -D \sin \theta
   \end{array}

La descomposición anterior es evidente visto el diagrama de la figura.

.. only:: latex

   .. figure:: esquemabola.pdf
      :align: center
      :scale: 100

      Diagrama del movimiento de la pelota

.. only:: html

   .. figure:: esquemabola.png
      :align: center
      :scale: 100

      Diagrama del movimiento de la pelota

El paso siguiente es utilizar el teorema :math:`\pi`, para el que hay
que escoger magnitudes características para la masa, la longitud y el
tiempo.

.. math::

   [M] \propto m, [L] \propto l, [T] \propto \frac{L}{U_0}

Llamaremos :math:`l` a la longitud de la pista de tenis y :math:`U_0`
a la velocidad inicial del saque. Estas magnitudes sirven para
adimensionalizar las incógnitas y legar a las ecuaciones
adimensinalizadas

.. math::

   \begin{array}{rl}
   \ddot \xi = &  -\frac{Dl}{mU_0^2} \cos \theta\\
   \ddot \eta = &  -\frac{gl}{U_0^2} - \frac{Dl}{mU_0^2} \sin \theta
   \end{array}

que pueden reescribirse como

.. math::

   \begin{array}{rl}
   \ddot \xi = &  -\delta \cos \theta\\
   \ddot \eta = &  -\gamma - \delta \sin \theta
   \end{array}

teniendo en cuenta además que

.. math::

   \cos \theta = \frac{\dot \xi}{\sqrt{\dot \xi ^2 + \dot
   \eta^2}},\quad \sin \theta = \frac{\dot \eta}{\sqrt{\dot \xi ^2 +
   \dot \eta ^2}}

De este modo toda la física del problema queda reducida a una
ecuación, una incógnita :math:`(\xi,\eta,\dot \xi,\dot \eta)` y los
parámetros :math:`\delta` y :math:`\gamma`.  Resolver el problema será
expesar estos parámetros en función de las incógnitas y las constantes
del problema tratando también el resto de parámetros que no han
aparecido aún.

El primero que abordaremos será :math:`\delta=\frac{Dl}{mU_0^2}`. Es
el parámetro dependiente de la resistencia aerodinámica de la pelota.
Esta resistencia puede descomponerse en el producto de una fuerza
característica con un coeficiente llamado *coeficiente de resistencia
parásita* o :math:`c_d`.  La expresión general es

.. math::

   D = q_\infty c_d = \frac{1}{2} \rho U_\infty^2 S c_d(Re)

donde :math:`S` es la superficie frontal de la pelota,
:math:`U_\infty` es la velocidad de la pelota y :math:`Re` es el
número de Reynolds del movimiento.  El parámetro :math:`\delta` será
entonces 

.. math::

   \delta = \frac{1}{8} \frac{\pi d^2 l}{m} 
   \frac{U^2}{U_0^2}\rho(h) c_d(Re)

De este parámetro surgen dos funciones, la primera es la densidad que
dependerá de la altitud y el segundo es el coeficiente de resistencia
parásita, dependiente del número de Reynolds que a su vez depende de
la densidad.  Por suerte este coeficiente ya ha sido calculado y
tabulado con anterioridad.  Debemos tener en cuenta que la superficie
de la pelota de tenis es rugosa y el flujo a su alrededor será
turbulento o estará cerca de la transición de flujo laminar o
turbulento. Puede encontrarse un estudio exhaustivo sobre el tema en
[MEH]_. De [ME2]_ puede extraerse que el :math:`c_d` se mantiene
constante y entre 0.6 y 0.7 en el rango de número de Reynolds de
interés.  De este modo reescribimos el parámetro :math:`\delta` como

.. math::

   \delta = \frac{1}{8} \frac{\pi d^2 l}{m} 
   (\dot \xi ^2 + \dot \eta ^2)\rho(h) c_d

.. warning::

   En ningún momento se ha diferenciado parámetros de valor constante
   de parámetros de valor variable.  En el segundo caso el parámetro
   será una función cuyos argumentos son otros parámetros e incluso
   las incógnitas. Lo que define un parámetro no es su valor sino el
   uso que se hace de él.  En este caso, :math:`\delta` es un
   parámetro porque no es una incógnita de la ecuación del sistema
   aunque dependa tanto de otros parámetros como de incógnitas y
   constantes.

Todo el problema puede reducirse entonces a bloques que se relacionan
por los parámetros como se ve en la figura.  Las cajas son funciones o
módulos que de alguna manera dependen de las incógnitas.  Los nombres
rodeados por corchetes son constantes y los rodeados por paréntesis
son parámetros.

.. only:: latex

   .. figure:: esquemabloques.pdf
      :align: center
      :scale: 100

      Diagrama de bloques del programa

.. only:: html

   .. figure:: esquemabloques.png
      :align: center
      :scale: 100

      Diagrama de bloques del programa
   
En el diagrama se puede apreciar que en el fondo un progrma no es más
que bloques que procesan parámetros hasta la función que resuelve el
problema, en este caso integrar una ecuacion diferencial ordinaria no
lineal. Ya conocemos uno de ellos, el bloque *ISA*, definido en el
ejemplo anterior.

Ha llegado el momento de empezar a fijar las constantes del problema:

* La pelota de tenis tiene las siguientes características:

  * Debe pesar entre 56 y 59.4 gramos.  Tomaremos 57.5

  * Su diámetro debe ser de 65.41 a 68.58 mm. Tomaremos 67

* La aceleración de la gravedad será de 9.81 :math:`\frac{m}{s^2}`

* El coeficiente de resistencia parásita será de 0.65

* Las características de la pista pueden leerse de la figura siguiente

.. only:: latex

   .. figure:: pistatenis.png
      :align: center
      :scale: 60

      Esquema de las medidas de una pista de tenis

.. only:: html

   .. figure:: pistatenis.png
      :align: center
      :scale: 100

      Esquema de las medidas de una pista de tenis



.. [MEH] Mehta RD. Aerodynamics of sports balls. Annual Review of
   Fluid Mechanics 1985; 17: 151–189.

.. [ME2] Rabindra Mehta, Firoz Alam and Aleksandar Subic. Review of
   tennis ball aerodynamics. Sports Technology, Volume 1, Issue 1 (p
   7-16)

