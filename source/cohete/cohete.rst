Mandar un cohete al espacio
===========================

.. sectionauthor:: David Marchante López


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
   \frac{p_s}{p_c}^{\frac{1}{\gamma}} \sqrt{\frac{2
   \gamma}{\gamma-1} \left[ 1- \left( \frac{p_s}{p_c}
   \right)^{\frac{\gamma-1}{\gamma}} \right]}}

A su vez, el gasto másico del cohete se obtiene de la expresión de la
velocidad de recesión de un combustible sólido dada por la siguiente
fórmula

.. math::

   \dot r = kp_c^{0.7}

Sabiendo además que la velocidad de recesión a una presión de 50
atmósferas es de 0.2 centímetros por segundo. Suponiendo además que el
combustible se quema frontalmente y que la superficie quemada es
aproximadamente la superficie frontal del cohete se llega a la
siguiente expresión para el gasto másico:

.. math::

   \dot m = \rho_c S_f k p_c^{0.7}

Se realizarán las siguientes hipótesis adicionales:

* El cohete asciende de modo completamente vertical por una atmósfera
  estándar.

* La presión en la cámara de combustión se mantiene constante e igual
  a 20 MPa.

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

Fórmulas adicionales
--------------------

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


Solución
--------

En esta solución aprenderemos el que es quizás el método sistemático
para modelar aplicaciones en Matlab.  Se basa en dos normas esenciales

* En las funciones todo son argumentos.

* Los parámetros definien un módulo.

Cuando una variable se pone en la cabecera de la definición de una
función pasa a ser un argumento de entrada.  En principio la función
dependerá sólo de estos argumentos pero esta imposición puede plantear
serias dificultades.  Supongamos que tenemos que integrar una ecuación
diferencial que depende del tiempo, de una variable espacial y de un
parámetro.  La rutina que integra la ecuación diferencial impone que
los únicos argumentos que puede tener la función a integrar son
precisamente el tiempo y la variable espacial.  Esto obliga a definir
de algún modo alternativo el parámetro dentro de la función.

Para evaluar este parámetro dentro de la función existen dos
posibilidades:

#. Evaluar una variable del espacio base con la función ``evalin``.

#. Definir los parámetros como variables globales.

Ambos planteamientos tienen muchos inconvenientes y prácticamente
ninguna ventaja.  Si se utiliza la función ``evalin`` la función
depende de cómo se escriba el programa principal y ya no puede ser
reutilizada de ninguna manera.  Definir variables globales dentro del
código es un riesgo innecesario puesto que además del inconveniente
anterior puede generar serios conflictos de nombres.

Parece que no hay ninguna manera de conseguir que una función dependa
de un parámetro sin tener que adaptar cada una de ellas al problema en
particular.  Para encontrar la solución hay que utilizar un poco el
pensamiento lateral: para cada función se define un interfaz.  De este
modo, una función que sólo espera argumentos puede adaptarse para que
distinga entre argumentos y parámetros.

Este método utiliza una característica muy interesante de los
*function handle*, si en ellos se define una variable que no se
encuentra en la cabecera automáticamente la busca en el espacio de
variables de la base.  Sólo lanza un error si no la encuentra.  Por
ejemplo

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

Como se puede comprobar, si la variable ``a`` no existe aparece un
error pero en el momento que se define ``a`` la función es capaz de
encontrar la variable y la utiliza como parámetro. Este planteamiento
es útil cuando, para resolver un problema dado, hay que utilizar una
rutina que requiere una función con una forma determinada; por ejemplo
la integración de una ecuación diferencial.

La ecuación de Van der Pol

.. math::

   x'' +x + \mu(x^2-1)x' = 0

depende del parámetro :math:`\mu`.  Como es una ecuación de uso común
para experimentar esquemas de integración temporal Matlab incluye las
funciones ``vdp1`` y ``vdp1000`` donde :math:`\mu` es 1 y 1000
respectivamente.

Definir dos funciones cuando sólo las diferencia un parámetro es poco
estético.  Este problema se puede solucionar fácilmente si se define
una única función y se cambia el parámetro en el espacio base.

.. code-block:: matlab

  % Octave
  clear all
  clc

  mu = 1;
  vdp = @(x,t) [x(2),mu*(1-x(1).^2)*x(2)-x(1)];
  x  = linspace(0,20,1000);
  y = lsode(vdp,[0 2],x);
  p = plot(x,y(:,1));
  
  mu = 1000;
  x = linspace(0,3000,100000);
  vdp = @(x,t) [x(2),mu*(1-x(1).^2)*x(2)-x(1)];
  y = lsode(vdp,[0 2],x);
  figure(2)
  p = plot(x,y(:,1));

.. code-block:: matlab

   %Matlab
   clear all
   clc
   
   mu=1;
   vdp=@(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];
   [t,y]=ode45(vdp,[0 20],[0 2]);
   p=plot(t,y(:,1));
   
   mu=1000;
   vdp=@(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];
   [t,y]=ode23s(vdp,[0 3000],[0 2]);
   figure(2)
   p=plot(t,y(:,1));
   
El planteamiento utilizado con los ejemplos anteriores tiene un punto
débil.  Los interfaces se evalúan en el momento de su definición, no
en el momento de su ejecución.  Si tras asignar ``mu`` como  1000 no
se hubiera redefinido el interfaz este no hubiera cambiado de valor.
Por ejemplo

.. code-block:: matlab

  >> a = 1;
  >> y = @(x) a*x;
  >> y(2)
  ans =  2
  >> a = 2;
  >> y(2)
  ans =  2

Esto obliga a redefinir cada interfaz después de cambiar cada
parámetro, una estrategia que no parece demasiado adecuada porque
fuerza a seguir una disciplina.  En la programación si el programador
está obligado a seguir una disciplina es porque está haciendo el
trabajo del ordenador. El paso siguiente es eliminar esa necesidad y
utilizar un concepto bastante conocido: los módulos.

Aquí llega la segunda norma de la programación en Matlab, los
parámetros definien el módulo.  Si se toma un módulo como un generador
de funciones, los argumentos de entrada de un módulo serán los
parámetros y los de salida las funciones.  De este modo hemos unido la
definición de los parámetros con la creación de los interfaces. Por
ejemplo, este sería un módulo destinado a crear la función de Van der
Pol

.. literalinclude:: modvdp.m
   :language: matlab

El parámetro :math:`mu` es el argumento de entrada del módulo y la
función, que en este caso es la misma que el interfaz, es el argumento
de salida.  Si un módulo devuelve sólo una función este puede
degenerar en una función anónima que devuelve otra función anónima

.. code-block:: matlab

  >> modvdp = @(mu) @(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];

Otro ejemplo.  La atmósfera ISA o atmósfera estándar se basa en
suponer que el gradiente de temperaturas hasta los 11000 metros es
lineal.

.. math::

  T(h) = T_0 + \lambda h

.. math::

   p(h) = p_0\left( \frac{T_0+\lambda h}{T_0}
   \right)^\frac{g}{R\lambda}

.. math::

   \rho(h) = \rho_0 \left( \frac{T_0+\lambda h}{T_0}
   \right)^{\frac{g}{R\lambda}-1}

Los parámetros asociados a la atmósfera son el gradiente de
temperatura, la gravedad, la constante de gas perfecto del aire y la
temperatura, la presión y la densidad a nivel del mar.  Este caso es
especialmente sencillo porque todas las funciones dependen del mismo
argumento: la altitud. Una posible manera de implementar este módulo
sería

.. literalinclude:: ISA.m
   :language: matlab

En el script se han considerado que la gravedad, el gradiente térmico
y la constante de gas perfecto del aire no son parámetros sino
constantes así que no es necesario ni siquiera ponerlos en la cabecera
del módulo.  Sin embargo las condiciones meteorológicas a altitud cero
son variables.
  
Este método puede utilizarse como punto de apoyo para articular
cualquier programa en Matlab por grande que sea. Los parámetros podrán
agruparse según el significado físico que tengan. En el caso del motor
cohete, algunos parámetros se referirán a la geometría de la tobera,
otros a las condiciones ambientales, otros a las características del
combustible... Cada familia de parámetros creará un módulo con las
funciones o los interfaces necesarios para resolver el problema.

Vamos a aplicar estos conceptos al problema del motor cohete.

.. literalinclude:: cohetem.m
  :language: matlab

Una de las diferencias históricas entre Matlab y Octave es la
integración de ODEs. Mientras Matlab dispone la colección de funciones
ode*, siendo ode45 la más comúnmente utilizada, Octave utiliza la
función lsode con una convención mucho más parecida a la rutina en
fortran a la que llama.

A parte de la llamada, si ode45 se encuentra un valor complejo, como
puede ser la raíz cuadrada de un número negativo, integrará el valor
absoluto de la función después de imprimir una advertencia por
pantalla. En cambio Octave dará un error y cortará la ejecución.

A continuación de lista la versión del mismo programa compatible con
Octave en el que se pueden apreciar las diferencias.

.. literalinclude:: cohete.m
  :language: matlab

En este ejercicio se aplica directamente la filosofía de las dos
normas.  Todas las funciones, en este caso function handles, están
definidas según su expresión teórica sin evaluar ninguna de sus
variables.

Esta aproximación a la resolución de problemas es más clara y más
potente, de hecho se ha conseguido resolver el problema entero sin
definir ninguna función.  Si fuera necesario cambiar algún parámetro,
como por ejemplo la sección frontal del cohete, bastaría con cambiar
su definición y volver a correr el script.

Estos son los resultados:

.. only:: latex

   .. figure:: h.pdf
      :align: center
      :scale: 80

      Altura en función del tiempo

.. only:: html

   .. figure:: h.png
      :align: center
      :scale: 100

      Altura en función del tiempo

.. only:: latex

   .. figure:: v.pdf
      :align: center
      :scale: 80

      Velocidad en función del tiempo

.. only:: html

   .. figure:: v.png
      :align: center
      :scale: 100

      Velocidad en función del tiempo

.. only:: latex

   .. figure:: M.pdf
      :align: center
      :scale: 80

      Número de Mach en función del tiempo

.. only:: html

   .. figure:: M.png
      :align: center
      :scale: 100

      Número de Mach en función del tiempo

.. only:: latex

   .. figure:: a.pdf
      :align: center
      :scale: 80

      Aceleración en función del tiempo

.. only:: html

   .. figure:: a.png
      :align: center
      :scale: 100

      Aceleración en función del tiempo
