Integración y Ecuaciones Diferenciales Ordinarias
=================================================

Este capítulo trata sobre dos disciplinas bastante extensas dentro del
Cálculo Numérico.  El motivo es que existen muchos métodos para
integrar una función o una ecuación diferencial y algunos funcionarán
mejores que otros según el caso.  Nos centraremos en las integrales
definidas

.. math::

   I = \int_{x_i}^{x_f} f(x) dx

y en los problemas de Cauchy; ecuaciones diferenciales ordinarias en
los que conocemos la ecuación diferencial y las condiciones iniciales
del sistema

.. math::

   \frac{d \vec x}{dt} = f(\vec x,t)\qquad \vec x(0) = \vec x_0

El resultado del primer problema es bien un número o una función que
depende de los límites de integración.  El resultado del segundo
problema es una trayectoria en el espacio :math:`\vec x(t)`.

Integración Numérica
--------------------

La complejidad de la integración depende de las dimensiones de nuestro
problema. Si queremos integrar una función con sólo una variable
:math:`f(x)` entonces necesitaremos la función (definida como función
anónima) y dos escalares que harán de límites de integración.  Si la
función depende de dos variables :math:`f(x,y)` la cosa se complica
porque el límite de integración es una curva en el plano.  Para esta
introducción nos frenaremos en el caso más fácil.

.. function:: quad(fun,a,b)

   Calcula la integral definida de una función entre los intervalos de
   integración *a* y *b*.  *fun* debe ser una función anónima.

Por ejemplo, supongamos que queremos saber la probabilidad que el
siguiente suceso de un fenómeno de media 5.4 y desviación típica 0.4
tenga un valor mayor que 7.

.. code-block:: matlab

  >> mu = 5.4;
  >> sig = 0.4;
  >> f = @(t) normpdf(t,mu,sig);
  >> prob = quad(f,7,100)
  
  prob =
  
     3.2601e-05

Este sencillo ejemplo nos sirve para entender perfectamente cómo
funciona la función ``quad``.  Hay otras variables de entrada y de
salida como la tolerancia en la integración o la estimación del error
de la operación.  Podemos obtener más información del cálculo anterior
con

.. code-block:: matlab

  >> [prob,err] = quad(f,7,100,1e-10)
  
  prob =
  
     3.1671e-05
  
  
  err =
  
      65

En este caso hemos exigido al algoritmo un error entre la precisión
simple y la doble precisión y hemos pedido también que nos muestre el
número de veces que ha evaluado la función para llegar al
resultado. Nos ha servido para comprobar que el error de la primera
integración ronda el 3% Otra función para realizar exactamente la
misma operación es ``quadl``

.. function:: quadl(fun,a,b)

  Ver función ``quad``. Según la documentación de Matlab ``quadl`` es
  más efectivo cuando se pide mayor precisión con una función sin
  demasiadas oscilaciones.


Para comprobar que muchas veces la documentación no se cumple
intentaremos hacer la misma integral con el algoritmo alternativo.

.. code-block:: matlab

  >> [prob,err] = quadl(f,7,100,1e-10)
  
  prob =
  
     3.1671e-05
  
  
  err =
  
     138

Vemos que necesita más evaluaciones para llegar al mismo resultado con
la misma precisión.  Si queremos hacer la integral impropia (aunque es
convergente), tanto ``quad`` como ``quadl`` fallan.  Sí podemos
utilizar ``quadgk`` para ello 

.. code-block:: matlab

  >> [prob,err] = quadgk(f,7,Inf)
  
  prob =
  
     3.1671e-05
  
  
  err =
  
     3.1140e-17


Utilizando la FDP normal acumulada podemos obtener el resultado
correcto.

.. code-block:: matlab

  >> 1-normcdf(7,5.4,0.4)
  
  ans =
  
     3.1671e-05

.. warning::

  El ejemplo anterior demuestra que la integración numérica, aunque en
  la mayoría de los casos no entrañará ninguna dificultad, puede
  proporcionar resultados imprecisos.  En algunos casos puede ser una
  buena idea comprobar los resultados de forma aproximada.

Lo mismo puede decirse de la integración bidimensional y
tridimensional.

.. note::

  La integración en más de una dimensión tiene fronteras más
  complejas.  En la integración bidimensional es una curva cerrada en
  el plano y en la tridimensional una superficie también cerrada.  Las
  funciones ``dblquad`` y ``triplequad`` sólo permiten integrar con
  límites constantes.
  
Integración de problemas de Cauchy
----------------------------------

Los sistemas de ecuaciones diferenciales no lineales suelen no tener
solución analítica.  Es entonces un coto particular del Cálculo
Numérico y Matlab cuenta con una gran artillería de herramientas para
resolver estos problemas.  Lo aprendido será fácilmente aplicable a
los problemas de condiciones de contorno. Por lo que respecta a los
problemas lineales, Matlab dispone también de funciones específicas
para resolverlos en el espacio de Laplace.

Nos centraremos en los problemas de condiciones iniciales o problemas
de Cauchy.  Para resolverlos necesitaremos la función del sistema, las
condiciones iniciales y el intervalo de tiempos de la solución.

Desde un punto de vista puramente práctico lo único que debemos saber
para resolver estos problemas satisfactoriamente es si el problema es
stiff o no. Para entender el significado de la *rigidez* de un sistema
es muy recomendable seguir un buen curso sobre resolución numérica de
ecuaciones en derivadas parciales.  Aquí sólo diremos que un sistema
es stiff cuando introduce gradientes fuertes y un método de
integración explícito es incapaz de resolverlos.

El ejemplo clásico para entender este problema es utilizar la ecuación
del oscilador de Van der Pol.

.. math::

  x'' + \mu(x^2-1)x' + x = 0

Esta ecuación de segundo orden es stiff con valores de :math:`\mu`
elevados.  Para comprobarlo podemos intentar resolver el problema com
:math:`\mu=1` y la función ``ode45``

.. note::

  Este ejemplo es tan popular que Matlab dispone ya de las funciones
  ``vdp1`` y ``vdp1000`` para la ecuación con :math:`mu=1` y
  :math:`mu=1000`.  Esta primera vez y a modo de ejemplo escribiremos
  la función

.. code-block:: matlab

   vdp1 = @(t,y) [y(1);y(2)*(1-y(1))-y(1)];
   [t,y] = ode45(vdp1,[0,20],[0;2]);
   plot(t,y(:,1))

.. function:: ode45(fun,tspan,y0)

  Integra la función *fun* que debe ser una función de dos variables
  de la forma *dy = fun(t,y)* donde **tanto y como dy deben ser
  vectores columna**.

  *tspan* es un vector de dos elementos con el intervalo de tiempos e
  *y0* es el vector de condiciones iniciales.

  Devuelve dos vectores de longitud arbitraria. *t* son los tiempos en
  los que se ha hallado la solución e *y* es un vector que contiene
  los vectores solución del problema en cada instante.

Al representar la solución llegamos al siguiente resultado.

.. only:: latex

   .. figure:: _static/vdp.pdf
      :align: center
      :scale: 70

      Solución del oscilador de Van der Pol para :math:`\mu = 1`

.. only:: html

   .. figure:: _static/vdp.png
      :align: center
      :scale: 100

      Solución del oscilador de Van der Pol para :math:`\mu = 1`

Si, por el contrario intentamos resolver el mismo problema con
:math:`\mu = 1000` nos encontraremos con la desgradable sorpresa de
que el Matlab no termina nunca de calcular.

El motivo es que en los problemas *stiff* el paso de tiempo necesario
para que un esquema explícito como el de ``ode45`` llegue a una
solución tiende a cero.  Esto es debido a que, antes de dar una
solución errónea, el esquema de paso variable va reduciendo el paso
temporal sin ninguna limitación.  Obviamente, si el paso temporal
tiende a cero, el tiempo necesario para llegar a la solución tiende a
infinito.

La solución es utilizar un esquema implícito como el ode23s.

.. note::

  En Matlab, los esquemas de integración que terminan con una s son
  implícitos y pueden integrar sistemas *stiff*

Una vez llegamos a la solución entendemos por qué no eramos capaces de
integrarla.

.. only:: latex

   .. figure:: _static/vdp1000.pdf
      :align: center
      :scale: 70

      Solución del oscilador de Van der Pol para :math:`\mu = 1000`

.. only:: html

   .. figure:: _static/vdp1000.png
      :align: center
      :scale: 100

      Solución del oscilador de Van der Pol para :math:`\mu = 1000`

.. code-block:: matlab

   [t,y] = ode23s(@vdp1000,[0,3000],[0;2]);
   plot(t,y(:,1))

.. warning::

  Sobre Octave.  Aunque el paquete odeint de Octave Forge proporciona
  las funciones ``ode45`` y ``ode23s`` entre otras, Octave dispone de
  un driver completamente distinto para resolver problemas de Cauchy
  llamado ``lsode``.  Para utilizarlo debemos tener en cuenta que la
  función a integrar se escribe con los argumentos permutados *dy =
  fun(y,t)* y que en la llamada, en vez de proporcionar el intervalo
  de tiempos, debemos proporcionar el vector de tiempos en los que
  queremos la solución.

  Otra diferencia importante entre ambos es que en Matlab las opciones
  de los esquemas de integración se modifican utilizando las funciones
  ``odeset`` y ``odeget``, mientras que en Octave debemos utilizar la
  función ``lsode_options``.

  Por ejemplo, las llamadas anteriores deberíamos efectuarlas en
  Octave como:

.. code-block:: matlab

  %Por omisión Octave utiliza un método implícito.
  lsode_options('integration metod','non-stiff');
  t = linspace(0,20,1000);
  y = lsode(vdp1,[0;2],t);

Ejercicio propuesto
-------------------

Representar en el espacio mediante la función ``plot3`` la trayectoria
de la partícula que, saliendo desde el punto (1,1,1) y
durante 50 unidades de tiempo, cumple la ecuación siguiente:

.. math::

  \begin{array}{rcl}
  \dot x & = & a(y-x)\\
  \dot y & = & x(b-z)-y\\
  \dot z & = & xy-cz  
  \end{array}
  
con *a* = 10, *b* = 28 y *c* = 8/3

Ejercicio propuesto
-------------------

Hallar el área de la región del plano comprendida entre la curva

.. math::

  y = \frac{x^2-1}{x^2+1}

y su asíntota.  La solución es :math:`2\pi`.
