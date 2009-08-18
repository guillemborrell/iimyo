Tutorial
========

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
  >> b = 1*i;
  >> a + b
  ans = 1 + 1i
  >> a * b
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
  >> b = 3.4*i;
  >> exp(b)
  ans = -0.96680 - 0.25554i

.. admonition:: Ejercicio

  Define tres variables con los siguientes valores: a = 1.5, b = 3.4 y
  c = 5.2.  Calcula el valor de d para
  :math:`d=\frac{a}{\frac{b}{c^a}-\frac{c}{b^a}}`

.. admonition:: Ejercicio

  En un Congreso Internacional de Matemáticas se votó como la fórmula
  más bella :math:`1=e^{-i\pi}`.  Comprueba que Matlab piensa que esta
  fórmula es correcta.  Te conviene utilizar la constante ``pi``.

.. admonition:: Ejercicio

  Comprueba que el producto de dos números complejos es igual al
  producto de sus módulos y la suma de sus argumentos. Puede ser que
  necesites las funciones ``angle`` y ``abs``.

.. admonition:: Ejercicio

  No existe el infinito en Matlab porque sirve para el Cálculo
  Numérico, no para el Cálculo Simbólico. Pero hay una constante
  propia llamada ``Inf`` que es un número lo suficientemente grande
  como para ser el infinito en la práctica (es un número más grande
  que el total de átomos de la masa conocida del Universo). La función
  tangente, ``tan`` conecta el valor de :math:`pi` con el infinito:
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

  >> v = `[11,12,13,14,15,16,117,18,19]
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


Ejercicio de síntesis
---------------------
