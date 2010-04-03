Matrices y Álgebra Lineal
=========================

Para seguir avanzando hacia el Álgebra Lineal es necesario definir el
concepto de Matriz en Matlab.  Técnicamente no hay ninguna diferencia
entre vectores, matrices o tensores.  De hecho todos los tipos
numéricos en Matlab son arrays sin distinción, cada dimensión que no
exista no es más que un índice que se mantiene en 1.  Para entenderlo
mejor podemos hacer este pequeño experimento

.. code-block:: matlab

   >> a = 1;
   >> a
   a =  1
   >> a(1)
   ans =  1
   >> a(1,1)
   ans =  1
   >> a(1,1,1)

Hemos definido un escalar y lo hemos llamado como un escalar, un
vector, una matriz y un array tridimensional.  A Matlab le ha dado
igual que en su definición pretendiéramos crear un escalar.

Desde este punto de vista, todos los vectores son en realidad matrices
que tienen sólo una fila o una columna.  La concatenación de vectores
fila o vectores columna generará una matriz.  El inconveniente es que
hasta ahora sólo conocemos vectores fila.

Si en un vector fila los elementos se separan con comas (o con
espacios) para generar un vector columna debemos separar los elementos
por puntos y comas.

.. code-block:: matlab

   >> v = [1;2;3]
   v =
   
      1
      2
      3
   
Como además hemos aprendido que para concatenar vectores sólo tenemos
que pegarlos ya podemos generar matrices pegando vectores fila o
vectores columna.  Por ejemplo:

.. code-block:: matlab

   >> [v,v,v]
   ans =
   
      1   1   1
      2   2   2
      3   3   3

Acabamos de crear nuestra primera matriz.  Matlab dispone de un
literal para las matrices que nos ahorra tener que escribir un vector
para cada fila o columna.  En este literal los elementos de una misma
fila se separan con comas y las filas se separan mediante puntos y
coma como se ve en el ejemplo siguiente:

.. code-block:: matlab

   >> u = [1,2,3;4,5,6;7,8,9]
   u =
   
      1   2   3
      4   5   6
      7   8   9

.. warning::

  Uno de los grandes defectos de Matlab es la ambiguedad al tratar
  vectores fila y matrices con una única columna.  Esto es debido a
  que, por omisión, un vector con un único índice es un vector fila
  mientras que el primer índice de una matriz cuenta los elementos de
  una misma columna.

  Para ejemplificar este problema crearemos el vector *u* y el vector
  *v* de la siguiente manera:

  .. code-block:: matlab

    >> u(3) = 1
    u =
    
       0   0   1
    
    >> v(3,1) = 1
    v =
    
       0
       0
       1

  Si Matlab fuera consistente estas dos instrucciones deberían generar
  el mismo vector, sin embargo en la primera generamos un vector fila
  y en la otra un vector columna.  Para agravar los efectos de la
  inconsistencia ambos vectores pueden utilizar la misma notación de
  índices:

  .. code-block:: matlab

    >> u(3)
    ans =  1
    >> v(3)
    ans =  1

  La única manera de no cometer errores graves por culpa del hecho que
  Matlab está mal pensado es recordar que existe un tipo *vector* y un
  tipo *matriz* o *array* que no tienen absolutamente nada que ver
  aunque Matlab sí sea capaz de operar entre ellos porque considera
  que un *vector* es una *matriz* con una única fila:

  .. code-block:: matlab

    >> u*v %Esto es lo mismo que el producto escalar
    ans =  1



Rutinas de creación de matrices
-------------------------------

Al igual que con los vectores, Matlab dispone de una ingente colección
de funciones que, combinadas adecuadamente, nos serviran para generar
prácticamente cualquier matriz.

.. function:: zeros(...)

   Crea una matriz con las medidas solicitadas llena de ceros.

   La función zeros se puede llamar de muchas maneras.  Si sólo se
   utiliza un índice crea una matriz cuadrada de dimensiones el valor
   del argumento de entrada.  Con dos argumentos creará una matriz del
   tamaño :math:`n \times m` siendo *n* el primer argumento y *m* el
   segundo.  Entonces, para crear un vector fila o un vector columna
   deberemos hacer lo siguiente:

   .. describe:: Ejemplo

      .. code-block:: matlab

      	 >> zeros(3,1)
      	 ans =
      	 
      	    0
      	    0
      	    0
      	 
      	 >> zeros(1,3)
      	 ans =
      	 
      	    0   0   0
      	 
.. function:: ones(...)

   Crea una matriz con las medidas solicitadas llena de unos.  Su
   funcionamiento es análogo al de ``zeros``

.. function:: eye(...)

   Crea una matriz con unos en la diagonal principal y ceros en el
   resto de sus elementos.  Su funcionamiento es análogo al de
   ``zeros``.

.. function:: rand(...)

   Crea una matriz cuyos elementos son números aleatorios.  Su
   funcionamiento es análogo al de ``zeros``.

Es importante recordar que, al igual que los vectores, cualquier
matriz puede juntarse con otra simplemente pegándolas.

.. code-block:: matlab

   >> [rand(3),zeros(3)]
   ans =
   
      0.80283   0.71353   0.73322   0.00000   0.00000   0.00000
      0.00527   0.07266   0.73062   0.00000   0.00000   0.00000
      0.73262   0.93908   0.77822   0.00000   0.00000   0.00000

Otra función útil para generar matrices es la función ``reshape``.

.. function:: reshape(A,m,n,...)

   Devuelve una matriz con dimensiones dadas a partir de los elementos
   de la matriz A.  En el caso que la matriz resultado no tenga el
   mismo número de elementos que la origen la función dará un error.

   .. describe:: Ejemplo

      .. code-block:: matlab

      	 >> reshape([1,2,3,4],2,2)
      	 ans =
      	 
      	    1   3
      	    2   4

Operaciones con matrices
------------------------

Los operadores de suma, resta, multiplicación, división y potencia
también funcionan con matrices siempre que sean del mismo tamaño.
También podemos aplicar las funciones elementales a matrices, lo que
nos dará el mismo resultado que si hubiéramos aplicado la función a
cada uno de los elementos.  Por ejemplo

.. code-block:: matlab

   >> exp(eye(4))
   ans =
   
      2.7183   1.0000   1.0000   1.0000
      1.0000   2.7183   1.0000   1.0000
      1.0000   1.0000   2.7183   1.0000
      1.0000   1.0000   1.0000   2.7183

Pero en el caso de las matrices existen operaciones propias como la
multiplicación matricial o la inversa. Estas operaciones también
tienen limitaciones: la multiplicación matricial exige que los tamaños
de los operandos sean compatibles y sólo las matrices cuadradas no
singulares tienen inversa.  Caso aparte son las divisiones matriciales
puesto que tenemos dos.

.. warning::

   La confusión entre operaciones escalares y matriciales es el error
   más común en Matlab.  Es tan recurrente que incluso programadores
   con varios años de experiencia lo cometen una y otra vez.  Para
   evitarlo en la medida de lo posible es recomendable utilizar, en
   vez de los operadores que veremos a continuación, las funciones que
   realizan la misma operación.

Multiplicación matricial
........................

Existen dos maneras de multiplicar matrices en Matlab; la más
utilizada es el operador multiplicación matricial ``*``, el mismo
operador que para la multiplicación escalar pero sin el punto.  La
otra es la función ``mtimes``

.. function:: mtimes(x,y)

   Multiplica las matrices *x* e *y* siempre que sus dimensiones sean
   compatibles, esto es, la traspuesta de *y* debe tener exactamente el
   mismo número de filas y columnas que *x*.  Es equivalente a
   ``x*y``.

En código existente en Matlab veremos pocas veces la función
``mtimes``. Históricamente siempre se ha tendido a la brevedad, sin
embargo evitar errores transparentes es importante.  Un error
transparente es un error no evidente viendo los resultados del código
paso a paso.  Un caso de error transparente es confundir la
multiplicación matricial con la escalar con matrices cuadradas.  Por
ejemplo

.. code-block:: matlab

  >> x = rand(3);
  >> y = rand(3);
  >> x*y
  ans =
  
     0.50380   1.42800   0.79806
     0.92682   1.45590   1.43060
     0.52361   0.90870   0.82197
  
  >> x.*y
  ans =
  
     0.210474   0.435326   0.274738
     0.055776   0.279980   0.101831
     0.457864   0.282493   0.252486   

La diferencia entre las dos matrices no es evidente.  Si nuestro
resultado dependiera de este cálculo sería prácticamente imposible
descubrir el error a no ser que sospechemos precisamente de esta
operación.

División matricial
..................



Existen dos tipos de división matricial aunque las dos operaciones
tienen poco que ver.  La división de un número puede definirse a
partir de la multiplicación invirtiendo uno de los factores.  Por
ejemplo

.. math:: 

   \frac{x}{y} = xy^{-1}

a su vez

.. math::

   \frac{y}{x} = x^{-1}y

Si nos fijamos en la parte derecha de las dos ecuaciones esto nos
podría servir para introducir otro operador de división.  En el caso
de la primera ecuación, en la que se invierte el segundo operando,
estamos delante de la división usual.  El número que se invierte es el
segundo.  Pero también podríamos tratar el segundo caso como una
división en la que el operando que se invierte es el primero.  Matlab
también tiene un operador para eso.  En este caso tenemos una división
*a derechas* y una división *a izquierdas*.

.. code-block:: matlab

  >> mrdivide(2,3)
  ans =  0.66667
  >> mldivide(2,3)
  ans =  1.5000
  
.. function:: mrdivide(x,y)

   Calcula la división *a derechas* de dos argumentos

.. function:: mldivide(x,y)

   Calcula la división *a izquierdas* de dos argumentos

Estas dos funciones también tienen su equivalente en operador.  La
división *a derechas* se expresa mediante el símbolo ``/``, mientras
que la división *a izquerdas* se expresa con el símbolo ``\``.

.. tip::

   Hay una regla mnemotécnica sencilla para recordar qué operador
   corresponde a qué operación. *A derechas* o *a izquierdas* se
   refiere qué argumento es el que se invierte.  En ``mrdivide`` se
   invierte el de la derecha, mientras que en ``mldivide`` se invierte
   el de la izquierda.  Si vemos los dos operadores, distinguiremos el
   concepto de *derecha* e *izquierda* mirando hacia dónde apunta el
   operador en dirección ascendente.  ``/`` apunta hacia la derecha,
   mientras que ``\`` apunta a la izquierda.

Aunque en escalares estas dos divisiones tienen poco sentido con
escalares sí lo tienen si los dos operandos son matrices.

.. math::

   \frac{A}{B} = AB^{-1}

a su vez

.. math::

   \frac{B}{A} = A^{-1}B

Pero de todas las operaciones la más importante es la resolución de
sistemas de ecuaciones lineales.  En cualquier caso estos sistemas de
ecuaciones pueden ponerse en forma matricial como

.. math::

   y = Ax

La solución de este sistema de ecuaciones implica que hay que realizar
una división matricial.

.. math::

   x = A^{-1}y

Llegaremos a la solución utilizando una división *a izquierdas*.  Lo
más interesante de este operador es que hace bastantes más cosas de
las que creemos.  :math:`A^{-1}y` es la inversa de una matriz por un
vector, pero no es estrictamente necesario calcular la inversa, se
puede resolver directamente el sistema de ecuaciones.  Matlab tiene
esto en cuenta y aplicará un algoritmo distinto dependiendo de las
características de la matriz.  Incluso funcionará con un sistema mal
condicionado o con una matriz no cuadrada, en tal caso dará una
solución minimizando el error cuadrático (pseudoinversa)

.. admonition:: Ejercicio 7

   Tres planos en el espacio tridimensional tienen las siguientes
   ecuaciones.

   .. math::

      \begin{array}{rcl}
      x-y+z & = & \sqrt{2}\\
      y + z & = & 1+\sqrt{2}\\
      x + y & = & 1+\sqrt{2}
      \end{array}
      
   Demostrar que tienen un único punto de intersección y encontrarlo
   resolviendo el sistema de ecuaciones.

Potencia de matrices
....................

Al igual que con el resto de operaciones aritméticas básicas
disponemos de una función y un operador para la potencia de una
matriz.  Esta operación sólo tiene sentido para matrices cuadradas,
para cualquier otra matriz dará un error.

.. function:: mpow(X,y)

   Eleva la matriz *X* a la *y* ésima potencia.  Es equivalente a
   utilizar el operador ``^``.

Traspuesta y conjugada
......................

Otro de los errores recurrentes si se trabaja con números complejos es
confundir el operador traspuesta con el operador traspuesta conjugada.

.. function:: transpose(X)

   Calcula la traspuesta de la matriz *X*. Es equivalente a ``X.'``.

.. function:: ctranspose(X)

   Calcula la traspuesta conjugada (adjunto) de la matriz *X*.  Es
   equivalente a ``X'``.

Cuando las matrices sean únicamente de números reales ambas
operaciones serán equivalentes pero confundirlos en el caso de números
complejos puede ser un error difícil de encontrar.

.. tip::

  Como hemos visto, existe el riesgo real de confundir operaciones
  escalares y matriciales, lo que puede generar errores catastróficos
  difíciles de solucionar.  Un truco útil para depurar estos errores
  es sustituir las operaciones matriciales por las funciones
  equivalentes correspondientes: ``mpow``, ``transpose``,
  ``mldivide``...

Ejercicio de Síntesis
---------------------

Si volvemos a la definición de polinomio

.. math::

  p_n(x) = \sum_{i=0}^n a_i x^i

Uno de los problemas ante los que podemos toparnos es el de encontrar
el polinomio que pasa por una serie de puntos dados.  Un polinomio
depende de los coeficientes que deciden, de este modo necesitamos
tantos puntos como coeficientes tenga el polinomio.  También podemos
tomar esta conclusión a la inversa.  El polinomio que pasa por *n*
puntos tendrá como mínimo órden *n-1*.

Podemos enunciar el problema como sigue. Dados *n* puntos :math:`(x,y)_n`
encontrar el polinomio de orden *n-1* que pasa por los puntos dados.

El problema se resuelve planteando una ecuación por cada punto.  Si
tomamos el polinomio :math:`p_n(x)` podremos plantear *n* ecuaciones
de la forma :math:`p_n(x_i)`.  Por ejemplo, para :math:`(x_0,y_0)`

.. math::

   p_n(x_0) = a_0 + a_1 x_0 + a_2 x_0^2 + \ldots + a_{n-1}x_0^{n-1} +
   a_n x_0^n = y_0

Si hacemos lo mismo para todos los puntos llegamos a un sistema de *n*
ecuaciones con *n* incógnitas, los coeficientes del polinomio
:math:`a_i`.

El paso siguiente es expresar el sistema de ecuaciones en forma
matricial:

.. math::

   \left[
   \begin{array}{ccccc}
   x_n^n & \ldots & x_n^2 & x_n & 1 \\
   x_{n-1}^n & \ldots & x_{n-1}^2 & x_{n-1} & 1  \\
   \vdots &  &  & \ddots & \vdots \\
   x_1^n & \ldots & x_1^2 & x_1 & 1 \\
   x_0^n & \ldots & x_0^2 & x_0 & 1 
   \end{array}
   \right]
   \left[
   \begin{array}{c}
   a_n \\ a_{n-1} \\ \vdots \\ a_1 \\ a_0
   \end{array}
   \right]
   = 
   \left[
   \begin{array}{c}
   y_n \\ y_{n-1} \\ \vdots \\ y_1 \\ y_0
   \end{array} 
   \right]

La matriz de este sistema de ecuaciones es la matriz de Vandermonde.
Podemos crear esta matriz en Matlab mediante la función ``vander``

.. function:: vander(c)

   Función que genera la matriz de Vandermonde

   .. math::

      \left[
      \begin{array}{ccccc}
      c_n^n & \ldots & c_n^2 & c_n & 1 \\
      c_{n-1}^n & \ldots & c_{n-1}^2 & c_{n-1} & 1  \\
      \vdots &  &  & \ddots & \vdots \\
      c_1^n & \ldots & c_1^2 & c_1 & 1 \\
      c_0^n & \ldots & c_0^2 & c_0 & 1 
      \end{array}
      \right]

   a partir del vector *c*

Ahora supongamos que queremos el polinomio que pasa por los puntos
(1,2), (2,1), (3,4), (4,3), (5,0)

.. code-block:: matlab

   >> x = linspace(1,5,5)';
   >> y = [2,1,4,3,0]';
   >> p = vander(x)\y
   p =
   
       0.41667
      -5.50000
      24.58333
     -42.50000
      25.00000
   
   >> polyval(p,1)
   ans =  2.0000
   >> polyval(p,2)
   ans =  1.00000
   >> polyval(p,3)
   ans =  4.0000
   >> polyval(p,4)
   ans =  3.0000
   >> polyval(p,5)
   ans = -7.8160e-14
