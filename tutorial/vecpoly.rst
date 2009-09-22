Escalares, vectores y polinomios
================================

El siguiente paso en cualquier curso de programación es dar una visión
general de las características del lenguaje.  Tratar todas las
sentencias, operadores, estructuras... Esto, a parte de ser
terriblemente aburrido, no es necesariamente útil en estos casos.
Nuestro objetivo es dominar las habilidades básicas para ser capaces
de resolver elegantemente problemas simples con Matlab.  Será más
adecuado ir aprendiendo el lenguaje sobre la marcha

Scripts y sesiones interactivas
-------------------------------

Debemos acostumbrarnos a ir escribiendo nuestro trabajo en el editor,
esto es, crear programas (también llamados guiones o scripts) y
ejecutarlos a través del intérprete.  Una pregunta recurrente de quien
empieza con Matlab y lleva un rato utilizando la consola. ¿Cómo puedo
guardar todo mi progreso? La respuesta es que nunca deberías haber
hecho nada importante con la consola.

La consola, con su línea de comandos, sirve para operaciones simples y
para interactuar con nuestros scripts.  Cuando escribimos código que
de verdad queremos guardar debemos hacerlo en un editor.  El primer
paso es entender cómo funcona el editor de Matlab, o por lo menos un
editor que sea se lleve bien con Matlab.

No necesitaremos el editor en este breve tutorial pero estáis
avisados.  Aprenderemos más sobre editores, scripts y atajos de
teclado en un rato.

Operaciones aritméticas básicas
-------------------------------

Podemos utilizar Matlab como una calculadora asombrosamente potente
para realizar operaciones sencillas y para aplicar funciones
elementales.  Una suma es tan sencilla como podría serlo

.. code-block:: matlab

  >> 2 + 2
  ans = 
        4

Recordad que las variables sirven para almacenar resultados en la
memoria y volverlos a utilizar

.. code-block:: matlab

  >> a = 4;
  >> a + 2;
  ans = 
        6

.. important::

  Por omisión Matlab siempre muestra el resultado del último cálculo.
  Esto sucede tanto en sesiones interactivas como en los programas que
  escribamos en el editor.  Para prevenir la salida de una ristra
  interminable de resultados intermedios debemos escribir un punto y
  coma al final de cada línea.

Los operadores matemáticos básicos se expresan en Matlab mediante los
siguientes símbolos:

* Suma: ``+``.

* Resta: ``-``. El signo menos también sirve como prefijo para
  expresar que un número es negativo.

* Multiplicación: ``.*``.

* División: ``./``.

* Potencia: ``.^``.

.. important::

  Probablemente os sorprenda el hecho que los últimos tres operadores
  utilicen un punto y no sean simplemente el símbolo.  La razón la
  entenderemos en el momento en el que empecemos a operar con
  matrices.

Hay muchos más operadores aritméticos, de momento nos hemos ceñido a
los más básicos.

Matlab es capaz de operar con números complejos gracias a que el
número imaginario :math:`i` es una constante expresada por la variable
``i``. Cualquier número multiplicado por ``i`` será en realidad la
componente imaginaria de un número complejo. Por ejemplo

.. code-block:: matlab

  >> a = 1;
  >> b = 1.*i;
  >> a + b
  ans = 1 + 1i
  >> a .* b
  ans = 0 + 1i

.. warning::

  Matlab no mostrará ningún aviso en el caso que sobreescribamos
  ``i``.  Para evitar posibles accidentes podemos utilizar símbolos
  alternativos para expresar la constante imaginaria: ``j``, ``I`` y
  ``J``.


Lo que convierte a Matlab en una herramienta útil es la enorme
biblioteca de funciones que cubre prácticamente cualquier disciplina
del cálculo numérico, desde el Álgebra Lineal al análisis de señales
pasando por la teoría de juegos o las redes neuronales.  Cualquier
función tiene argumentos de entrada y argumentos de salida y Matlab
los trata de una manera un poco particular.  Las funciones más simples
tienen sólo un argumento de entrada y otro de salida

.. code-block:: matlab

  >> sin(1.4)
  ans = 0.98545

  >> sqrt(4)
  ans = 2

Como no hemos asignado el argumento de salida a ninguna variable
Matlab ha utilizado la variable especial ``ans`` de la que hemos
hablado en el capítulo anterior.  Hay funciones que tienen varios
argumentos de entrada y de salida como por ejemplo la función ``quad``
que calcula la integral numérica de una función en un intervalo
dado. ``quad`` tiene cinco argumentos de entrada y cuatro de salida y
es prácticamente imposible que la utilicemos correctamente sin
consultar la documentación.  Hacerlo es tan sencillo como escribir lo
siguiente en el intérprete

.. code-block:: matlab

  >> help(quad)

Acabamos de aprender el nombre de *la función más importante de
Matlab*, ``help``.  Todas las funciones de la biblioteca de Matlab
están perfectamente documentadas y tenemos acceso a esa información a
través de ``help``.

Siempre que sea matemáticamente consistente cualquier función operará
indistintamente con números reales y complejos:

.. code-block::  matlab

  >> a = 1.6;
  >> b = 3.4.*i;
  >> exp(b)
  ans = -0.96680 - 0.25554i

.. admonition:: Ejercicio 1

  Define tres variables con los siguientes valores: a = 1.5, b = 3.4 y
  c = 5.2.  Calcula el valor de d para
  :math:`d=\frac{a}{\frac{b}{c^a}-\frac{c}{b^a}}`

.. admonition:: Ejercicio 2

  En un Congreso Internacional de Matemáticas se votó como la fórmula
  más bella :math:`1=e^{-i\pi}`.  Comprueba que Matlab piensa que esta
  fórmula es correcta.  Te conviene utilizar la constante ``pi``.

.. admonition:: Ejercicio 3

  Comprueba que el producto de dos números complejos es igual al
  producto de sus módulos y la suma de sus argumentos. Puede ser que
  necesites las funciones ``angle`` y ``abs``.

.. admonition:: Ejercicio 4

  No existe el infinito en Matlab porque sirve para el Cálculo
  Numérico, no para el Cálculo Simbólico. Pero hay una constante
  propia llamada ``Inf`` que es un número lo suficientemente grande
  como para ser el infinito en la práctica (es un número más grande
  que el total de átomos de la masa conocida del Universo). La función
  tangente, ``tan`` conecta el valor de :math:`\pi` con el infinito:
  :math:`\infty = \tan(\frac{\pi}{2})`. Si utilizamos la expresión
  anterior para calcular el infinito en Matlab no llegamos a un número
  tan grande.  ¿Puedes dar una explicación?

Definición de funciones
-----------------------

Ahora ya sabemos operar con escalares y con funciones simples.  El
siguiente paso es aprender a definir nuestras propias funciones.  Hay
dos maneras de definir una función en Matlab, de momento nos basta con
la más sencilla y a la vez la menos potente: mediante el operador
``@()``. La sintaxis queda bien clara mediante el siguiente ejemplo:

.. code-block:: matlab

  >> fsin = @(x) x - x.^3/6
  fsin =
  
  @(x) x - x .^ 3 / 6
  >> fsin(pi)
  ans =  8.3093

Una función definida por el usuario puede hacer uso tanto de otras
funciones independientemente de su origen.

.. code-block:: matlab

  >> comp = @(x) fsin(x) - sin(x)
  comp =
  
  @(x) fsin (x) - sin (x)
  >> comp(0.1)
  ans = 3.3325e-004

.. note::

  Técnicamente lo que hemos definido antes no es exactamente una
  función y de hecho no se llama función sino *función anónima*.  Pero
  de momento no encontraremos ninguna diferencia.

Vectores
--------

El vector es el tipo derivado más simple de Matlab.  Se trata de una
concatenación de números ordenados en fila.  La característica más
importante de los vectores es que son un conjunto ordenado del que
podemos tomar uno o varios de sus elementos a partir de su índice.

La manera más sencilla de definir un vector es utilizando un literal:

.. code-block:: matlab

  >> v = [11,12,13,14,15,16,117,18,19]
  v = 

     11   12   13   14   15   16   17 ...

Podemos obtener un elemento del vector llamándolo como si fuera una
función

.. code-block:: matlab

  >> v(2)
  ans  =  12

Obtener porciones del vector es tan fácil como obtener
elementos. Basta con separar el primer ínidice del último con dos
puntos

.. code-block:: matlab

  >> v(2:4)
  ans = 

     12   13   14

También podemos utilizar otro vector para obtener un vector con
elementos individuales

.. code-block:: matlab

  >> v([2,4,6,7]
  ans = 

     12   14   16   17

Difíclmente escribiremos nunca un vector largo en Matlab.  O lo
obtenderemos como dato o utilizaremos una función específicamente
diseñada para ello como ``linspace`` o ``logspace``.

.. function:: linspace(base, limit, N)

  Devuelve un vector fila con *N* elementos separados linealmente
  entre *base* y *limit*

  Ejemplo::

    >> linspace(0,10,11)
    ans = 

        0  1  2  3  4  5  6  7  8  9  10

.. function:: logspace(base, limit, N)

  Similar a ``linspace`` excepto que los valores están espaciados
  logarítmicamente entre :math:`10^{base}` y :math:`10^{limit}`.

Cuando un vector se opere con un escalar se operará con cada uno de
los elementos del vector.

.. code-block:: matlab

  >> v = [1,2,3,4];
  >> 3+v
  ans =
  
     4   5   6   7
  >> 3.*v
  ans =
  
      3    6    9   12

Si los dos operandos son vectores el requisito fundamental es que
ambos tengan el mismo tamaño.

.. code-block:: matlab

  >> w = [8,7,6,5];
  >> v+w
  ans =
  
     9   9   9   9
  >> v.*w
  ans =
  
      8   14   18   20

.. important::

  No existe una multiplicación de vectores, la operación anterior es
  operar los vectores elemento elemento, lo que corresponde más a una
  tabla que a lo que se esperaría de un vector.  De hecho en Cálculo
  Numérico no hay ninguna diferencia entre un vector y una simple
  lista de números.

Una operación importante cuando se habla de vectores es el producto
escalar, que se define como.

.. math::
  :label: dot

  u \cdot v = \sum_i u_i v_i

En Maltab puede calcularse con la función ``dot``.

.. function:: dot(u,v,dim)

  Calcula el producto escalar de dos vectores.  El tercer argumento,
  *dim* es de utilidad en el caso que alguno de los dos argumentos o
  ambos sean matrices.

.. code-block:: matlab

  >> dot(v,w)
  ans =  60

.. warning::

  En muchos programas escritos en Matlab encontraremos el producto
  escalar escrito como

  .. code-block:: matlab

    >> u'*v

  Es una operación válida, aunque aún no sepamos qué operaciones son
  el apóstrofe y el asterisco sin punto respectivamente.  El problema
  de no utilizar la función ``dot`` es que estamos utilizando una
  sintaxis ambigua, no sabemos si ``u`` y ``v`` son vectores, además
  de ser una opreación mucho más propensa a fallar sin dar excesiva
  información del porqué.  Recordad que la belleza es importante.

.. admonition:: Ejercicio 5

  Cuando Gauss contaba siete años el profesor les puso un ejercicio
  para tenerlos entretenidos un rato. ¿Cuánto es la suma de todos los
  números enteros entre 1 y 100? Gauss llegó fácilmente al reultado en
  sólo unos pocos segundos porque vio que sumando pares de números
  1+99, 2+98, 3+97... La operación podía reducirse a 50 :math:`\times`
  99+100. Con Matlab se puede hacer la operación por fuerza bruta de
  muchas maneras pero... ¿Eres capaz de hacerlo con sólo una línea de
  código?

    
Polinomios
----------

Se define un polinomio de grado *n* como

.. math::
  :label: poly

  p(x) = a_0 + a_1 x + a_2 x^2 + \ldots + a_{n-1}x^{n-1} + a_n x^n


No es más que una función en la que el valor de la variable se eleva
sucesivamente a una potencia hasta *n* y se multiplica por una
constante.  Utilizando el símbolo del sumatorio la expresión anterior
puede compactarse a:

.. math::

  p(x) = \sum_{i=0}^n a_i x^i

Si nos fijamos un momento en la expresión :eq:`poly` observaremos que
un polinomio puede expresarse fácilmente en forma de vector utilizando
sus coeficientes.  El orden puede deducirse fácilmente con el número
de coeficientes.  Matlab utiliza vectores para expresar los polinomios
con la única salvedad que los almacena del modo inverso al que hemos
escrito :eq:`poly`.  El polinomio :math:`x^3-x+1` sería en Matlab

.. code-block:: matlab

  >> p = [1, 0, -1, 1];

La importancia de los polinomios es que, siendo una función, todas las
operaciones elementales (suma, resta, multiplicación y división)
pueden reducirse sólo a operaciones con sus coeficientes.  De esta
manera podemos convertir operaciones simbólicas en operaciones
puramente numéricas.  Tomemos por ejemplo estas dos funciones:
:math:`p(x) = 4x^3-x` y :math:`q(x) = x^2 + 6`. Sumar y restar estas
dos funciones es trivial, pero no multiplicarlas.  Como se trata de
una operación con coeficientes Matlab la hará sin inmutarse

.. code-block:: matlab

  >> p = [4, 0, -1, 0];
  >> q = [1, 0, 6];
  >> conv(p,q)
  ans =
      4    0   23    0   -6    0

.. function:: conv(u,v)

  Calcula la convolución de dos vectores de coeficientes.  En el caso
  de vectores, la convolución es la misma operación que el producto.

Efectivamente :math:`p(x)*q(x) = 4x^5+23x^3-6x`.

Dividir dos polinomios nos servirá para aprender cómo tratar las
funciones con dos argumentos de salida.  De define la división de dos
polinomios como

.. math::

  p(x) = q(x)*c(x) + r(x)

Entonces la división entre :math:`p(x)` y :math:`q(x)` tiene como
resultado dos polinomios más, el cociente :math:`c(x)` y el residuo
:math:`r(x)`.  Si a la salida de ``deconv`` se le asigna sólo una
variable obtendremos el cociente

.. function:: deconv(u,v)

  Calcula la deconvolución de dos vectores de coeficientes.  En el
  caso de polinomios esta operación es equivalente al cociente del
  primero por el segundo.

  Devuelve dos argumentos, el cociente y el residuo.

.. code-block:: matlab

  >> c = deconv(p,q)
  c = 
      4  0

Si necesitamos también el residuo tendremos que hacer lo siguiente

.. code-block:: matlab

  >> [c,r] = deconv(p,q)
  c = 
      4  0

  r = 
      0  0  -25  0

Ejercicio de síntesis
---------------------

Existe una manera de representar la forma de una función cualesquiera
en un punto dado mediante un polinomio.  Dicho polinomio converge con
mayor orden en los alrededores del punto a medida que se van añadiendo
términos.  Se trata del desarrollo de Taylor.

La única información que necesitamos de la función es su valor y el de
sus derivadas en el punto dado :math:`x_0`.  La expresión general es

.. math::

  p(x-x_0) = f(x_0) + \sum_{i = 1}^N f^{(i)}(x_0)\frac{(x-x_0)^i}{i!}

Para entender mejor cómo este polinomio se ajusta a la función podemos
utilizar el desarrollo de la función exponencial en :math:`x=0`.

.. math::

  e^x = 1 + x + \frac{1}{2} x^{2} + \frac{1}{6} x^{3} +
  \frac{1}{24} x^{4} + \frac{1}{120} x^{5} +
  \operatorname{\mathcal{O}}\left(x^{6}\right)

Este polinomio puede crearse de muchas maneras pero vamos a utilizar
un vector y vamos a hacer todas las operaciones a la vez para crear
una función que calcule el desarrollo hasta el término enésimo.

.. code-block:: matlab

  >> exp_serie = @(x,n) 1 + sum((x.^linspace(1,n,n))./...
  factorial(linspace(1,n,n)))
  exp_serie =

     @(x, n) 1 + sum ((x .^ linspace (1, n, n)) ./ factorial (linspace (1, n, n)))

.. note::

  Esta línea de código sirve para aprender una regla muy importante
  sobre cómo debemos escribir un programa.  Las líneas demasiado
  largas son difíciles de leer, por lo tanto son un peligro incluso
  para nosotros mismos.  Es recomendable romperlas en algún punto
  donde romperíamos una operación matemática: después de un operador,
  justo después de abrir un paréntesis.  Para hacerlo debemos escribir
  tres puntos ``...``.

Sabemos que :math:`e^1 = e` así que podemos utilizar este resultado
para demostrar que el error que comete el desarrollo de Taylor es del
orden del exponente que se omite. Para ello representaremos
gráficamente el error en :math:`x=1` en función de *n* con la función
``plot``.  En unos pocos capítulos aprenderemos más sobre esta
función.

