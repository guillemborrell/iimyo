Diseño de aplicaciones en Matlab
================================

En ninguno de los muchos libros, cursos, introducciones o tutoriales a
Matlab se trata un tema tan esencial como la manera correcta de
estructurar un programa en Matlab.

Matlab no es, por desgracia, un lenguaje pensado para grandes
aplicaciones sino para pequeños prototipos sin demasiada importancia.
En las últimas versiones, gracias a la mejora de su orientación a
objetos, ha ganado algo de entidad al respecto pero nunca hay que
olvidar que no se trata de el único lenguaje del mundo. Matlab se ha
acercado a C++ y Java pero va muy a la zaga de los lenguajes dinámicos
más modernos como Python o Ruby.

Se pueden diseñar correctamente aplicaciones de cierto tamaño
independientemente del paradigma utilizado.  El sistema bancario
mundial funcionaba antes que los objetos o los módulos hicieran acto
de presencia por primera vez.  Esta sección propone una manera
sistemática de reducir cualquier problema a estructuras propias de
Matlab intentando que ninguna parte del resultado parezca ajena al
lenguaje.

No es más que la enésima propuesta de cómo se debe programar en Matlab
así que nada la mantiene a salvo de posibles detractores.  Puede ser
mejor o peor que otros métodos pero nunca hay que olvidar que un mal
método siempre es mejor que ninguno.

Los dos axiomas
---------------

Los paradigmas de programación son una manera sistemática de reducir
la implementación de cualquier algoritmo a un número limitado de
estructuras. Existe la programación procedimental, la modular, la
orientación a objetos... Dentro de los paradigmas pueden existir
acercamientos, metodologías para reducir las estructuras que uno
encuentra en la realidad a las que soporta el paradigma.  Hay muchas
maneras posibles de construir clases o módulos, quizás tantas como
programadores.  Este capítulo no trata sobre paradigmas, hemos
escogido de antemano un acercamiento modular, sino de una manera
sencilla y sistemática de reducir la mayoría de problemas a un
conjunto conectado de bloques.

La programación es un ejercicio de diseño y como son de aplicación las
teorías del diseño axiomático.  La programación es un ejercicio
creativo porque es un problema NP.  Es muy difícil crear un buen
diseño pero es relativamente fácil descubrir si una solución es buena
o mala.  La teoría del diseño axiomático se basa dos hipótesis sobre
qué qué características son deseables para el producto, sea cual sea
su naturaleza. Estos axiomas son aplicables tanto a un dispositivo
electrónico como a un fórmula uno y pueden reducirse a dos.  Un buen
diseño tendrá

* Máxima independencia.

* Mínima información.

Máxima independencia significa que cada una de sus piezas estará mejor
diseñada en la medida que su funcionamiento sea independiente de las
demás.  Pensemos en dos mecanismos que transmiten exactamente el mismo
movimiento, uno tiene más piezas pero cada uno de los engranajes está
en contacto con otros dos, el otro tiene menos piezas pero uno de los
engranajes está en contacto a otros tres.  Si preguntamos a un
ingeniero industrial descartará inmediatamente el segundo porque sabe
a ciencia cierta que el mínimo error en la posición de ese triple
contacto acabará con el mecanismo. Introducir dependencias entre
elementos, aunque pueda reducir su número, suele producir sistemas
menos robustos.

La información de un sistema es la cantidad de datos necesarios para
construirlo y asegurar su funcionamiento. En un mecanismo la cantidad
de información se correspondría a todos los datos mostrados en el
plano: medidas, tolerancias, relaciones... La información es lo que
valora la simplicidad del producto.

La complejidad del proceso de diseño radica en que diseñar para la
máxima independencia es incompatible con diseñar con mínima
información y viceversa. Como cabía esperar, todo se basa en buscar la
justa medida de cada cosa.

El siguiente paso es conseguir relacionar los dos axiomas con la
implementación de algoritmos pero este paso choca frontalmente con la
complejidad del problema.  Como ya hemos dicho, es imposible encontrar
el mejor diseño pero gracias a los dos axiomas es más sencillo
comparar las propuestas y escoger el mejor.  El ejercicio habitual es
tomar dos lenguajes de programación y valorar cuál es mejor ante los
dos axiomas para una determinada tarea.  El hecho de proponer una
tarea en concreto es importante porque esta comparación dependerá
fuertemente de la misma. Por ejemplo, Python será mejor que Fortran
para construir una interfaz gráfica pero estas diferencias se diluirán
si se trata de una aplicación de cálculo numérico.

Este capítulo propone una metodología para el diseño de aplicaciones
con Matlab utilizando la programación modular.  Para intentar cumplir
los dos axiomas buscará:

* Máxima independencia entre bloques

* Sistematizar el desarrollo con el menor número de leyes posibles.

Las dos leyes
-------------

La propuesta para cumplir los dos axiomas puede reducirse a dos leyes:

* Para las funciones todo son argumentos

* Los parámetros relacionan los bloques

Estas dos leyes sirven para reducir cualquier sistema físico a bloques
cuyos argumentos de salida son funciones. Estos conceptos se aclararán
a medida que avancemos por este capítulo.

Las variables en un programa se pueden clasificar en tres grupos

#. Constantes

#. Parámetros

#. Incógnitas

Para entender las diferencias entre los tres grupos supongamos que
deseamos simular la trayectoria de la pelota de tenis tras un saque.
Las constantes del problema son las cantidades físicas que no
cambiarán bajo ninguna circunstancia, por ejemplo y en este caso
concreto la aceleración de la gravedad o el diámetro de la pelota. Los
parámetros son los valores que intervienen en el problema cuyo valor
no cambia durante el cálculo pero sí son suceptibles de cambio como
por ejemplo la densidad del aire o la velocidad de salida.  Finalmente
las incógnitas son los valores que deben calcularse necesariamente
para llegar al resultado como la trayectoria y la velocidad de la
pelota. Siempre existe una diferenciación clara entre estos tres
grupos y puede ser de gran ayuda para modelar cualquier sistema
físico.

Mientras las constantes y las incógnitas nunca presentan el menor
problema los parámetros son el mayor dolor de cabeza cuando se diseña
una simulación.  Las constantes pueden ser sustituidas en cualquier
momento por un valor y las incógnitas serán argumentos de todas las
funciones porque son parte del resultado.  En cambio los parámetros se
definirán en una cabecera o en un módulo y todas las funciones deberán
utilizar dicha definición.  Esta problemática puede comprenderse
fácilmente con este ejemplo.  Supongamos que nos piden evaluar la
influencia del parámetro :math:`\mu` en la solución de esta ecuación

.. math::

   x'' +x + \mu(x^2-1)x' = 0

Para ello nos sugieren representar gráficamente la solución para un
conjunto de diez valores de :math:`\mu`. Se nos pide resolver el
problema de la integración de una EDO diez veces con un parámetro,
algo que para un principiante puede representar un serio problema.

Tanto en Matlab como en Octave la rutina para integrar ecuaciones
diferenciales sólo tiene dos argumentos: el tiempo y la variable que
se integrará independientemente de si es un escalar o un vector. No
hay manera de definir parámetros adicionales que tenga que evaluar
antes de cada integración, sólo quiere las incógnitas.

Existen varias posibilidades para considerar los parámetros en un
problema.  Vamos a contemplar tres de ellas: la función ``evalin``,
las variables globales y las funciones anónimas.

Para entender la función ``evalin`` y las variables globales hay que
recordar que cuando el hilo de ejecución entra en una función el
espacio de variables cambia completamente.  Se entra en otro entorno
en el que sólo están definidos los argumentos y las variables
globales.

La función ``evalin`` es capaz de evaluar una variable fuera del
contexto de la función.  Matlab llama al contexto del programa
principal *base* y al contexto de la función *caller*.

.. function:: evalin(context, try, catch)

   Evalúa una sentencia en el contexto *context* que puede ser bien
   *base* o *caller* 

Un ejemplo de uso de la función ``evalin`` sería evaluar una variable
del espacio base de la siguiente manera

.. code-block:: matlab

   function y = vdp(t,x)
     mu = evalin('base','mu','error()')
     y = [x(2); mu*(1-x(1).^2)*x(2)-x(1)];

Obviamente llegaremos a un error en el caso que no hayamos definido
previamente la variable `mu` en el programa principal.  Podemos hacer
algo parecido definiendo `mu` como una variable global

.. code-block:: matlab

   function y = vdp(t,x)
     if isglobal('mu')
       global mu;
       y = [x(2); mu*(1-x(1).^2)*x(2)-x(1)];
     else
       error();
     end

Ambas maneras de pasar los parámetros a la definición de la función
aumentan la dependencia entre la definición de la función y el
programa principal rompiendo con el primer axioma.  Debe haber una
manera más apropiada de conseguir que las funciones sean capaces de
evaluar parámetros.  Toda esta problemática queda completamente
subsanada en el momento en el que somos capaces de devolver una
función como argumento.  Analicemos la función de la ecuación de Van
der Pol con más detenimiento.  Tiene dos incógnitas, :math:`t` y
:math:`x`, y un parámetro, :math:`\mu`. Es en este punto donde de
forma completamente natural llega la necesidad de crear un bloque.
Definimos entonces un bloque como una estructura que depende de una
colección de parámetros y devuelve una o varias funciones que dependen
de las incógnitas. En este caso el bloque dependerá únicamente del
parámetro :math:`\mu` y proporcionará la función ``vdp``.

Para entender el funcionamiento interno de un bloque hay que tener en
cuenta que si una función anónima depende de una variable que no está
en su cabecera la busca automáticamente en el espacio de variables
local.  Por ejemplo

.. code-block:: matlab

  >> f = @(x) a*x;
  >> f(3)
  error: `a' undefined near line 1 column 10
  error: called from:
  error:    at line -1, column -1
  >> a = 3;
  >> f = @(x) a*x;
  >> f(3)
  ans =  9

Esta será la propiedad que utilizaremos para generar las funciones que
serán argumentos de salida del módulo.  En el caso de la ecuación de
Van der Pol el módulo tendría este aspecto

.. literalinclude:: modvdp.m
   :language: matlab

.. tip::

   Cuando un módulo sólo proporciona una función puede reducirse a una
   única función anónima.  Por ejemplo en el caso del módulo anterior

   .. code-block:: matlab

      >> modvdp = @(mu) @(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];

Esta operación ha convertido una función, una entidad con significado
físico, en un bloque de código.  Este bloque recibe parámetros y
devuelve una función que únicamente depende de las incógnitas.  A su
vez está escrita según su formulación, no se ha particularizado para
ningún valor. Cumple estrictamente las dos leyes pero es un ejemplo
demasiado sencillo como para captar la importancia de su aplicación.

A continuación veremos varios ejemplos donde el uso de las dos leyes
producen implementaciones simples de sistemas no necesariamente
sencillos.

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
saque de Andy puede llegar a los 215 kilómetros por hora.

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

   \delta = \frac{1}{8} \frac{\pi d^2}{m} 
   \frac{U^2}{U_0^2}\rho(h) c_d(Re)

De este parámetro surgen dos funciones, la primera es la densidad que
dependerá de la altitud y el segundo es el coeficiente de resistencia
parásita, dependiente del número de Reynolds que a su vez depende de
la densidad.  Por suerte este coeficiente ya ha sido calculado y
tabulado con anterioridad.  Debemos tener en cuenta que la superficie
de la pelota de tenis es muy rugosa y el flujo a su alrededor será
turbulento.
