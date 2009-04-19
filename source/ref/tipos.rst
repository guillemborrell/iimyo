Tipos, operadores y expresiones
===============================

Matlab es un lenguaje dinámico con lo que no es necesario declarar el
tipo de una variable.  Será más sencillo entender las implicaciones
de lo anterior empezando con lo más simple

.. code-block:: matlab

   >> a = 1;

La línea de código anterior tiene tres símbolos:

* ``a`` es una variable

* ``=`` es el operador asignación.  

* ``1`` es el dato introducido de forma explícita.  Esta manera de
  introducir los datos se llama *literal*

Una manera intuitiva de entender mejor los lenguajes dinámicos es
imaginar que el operador asignación hace más de lo que parece.  Si la
variable no existe reserva la memoria necesaria con el tipo del
literal o del resultado de las expresiones que estén en el lado
derecho del operador. Si la variable ya existiera la sobreescribiría
haciendo las mismas operaciones que en el caso anterior.  Como las
variables no tienen un tipo asignado mediante una declaración previa
la unión entre la variable y su valor es mucho más débil que en los
lenguajes estáticos como C o Java donde la declaración es
imprescindible.

.. code-block:: matlab

   >> a = 1;
   >> a = [1,2,3,4]
   a = 

      1  2  3  4

El tipo asignado a la variable ``a`` a través del literal no es
inmutable, como se dice en el párrafo anterior, basta con crear una
nueva asignación para dar a la variable un uso completamente
distinto. Este comportamiento tiene tanto ventajas como
inconvenientes. Se es más productivo si desaparece la necesidad de
declarar variables pero desaparece una protección importante ante
errores en tiempo de ejecución.

Podemos imaginar las variables en los lenguajes dinámicos como un
simple nombre para manipular lo que se ha creado mediante el operador
asignación ya sea a través de un literal o de otras expresiones.

.. function:: typeinfo(expr)

   Imprime en la pantalla el tipo del resultado de la expresión
   *expr*.  Si no se da ningún argumento lista todos los tipos
   disponibles

.. note::

   Ver en la sección destinada a funciones en concepto de Duck Typing.


Tipos numéricos
---------------

Escalares
.........

Matlab trata de un modo bastante particular los tipos numéricos.
Cualquier escalar definido por un literal genera un real de doble
precisón

.. code-block:: matlab

  >> a = 1;
  >> typeinfo(a)
  ans = scalar
  
Esto significa que cualquier escalar es en memoria por defecto un real
de doble precisión.  Si se necesita definir un escalar de cualquier
otro tipo deberá utilizarse la función correspondiente.

Los reales de doble precisión definidos por IEEE_ son los números
entre el 2.2251e-308 al 1.7977e+308 con una precisión de
aproximadamente 2.2204e-16, esto es, dieciseis cifras
significativas. Este número depende de la arquitectura del ordenador y
de si éste soporta o no la aritmética en coma flotante de 64 bits de
IEEE_.  Esta colección de números debería ser suficiente para expresar
cualquier cantidad con sentido físico puesto que los límites son
superiores al número de átmos del universo y la precisión está cerca
de la longitud de Planck.

.. important::

   En el Cálculo Numérico no hay más remedio que expresar números
   reales mediante datos con precisión limitada.  El concepto de
   precisión numérica se hace a veces incómodo cuando uno espera un
   resultado exacto como puede ser 0 o :math:`\sqrt{2}`.  Nunca hay
   que perder de vista que la representación de un número :math:`\phi`
   será siempre :math:`\varphi \pm \epsilon` donde :math:`\epsilon` es
   el error debido a la naturaleza finita de la mantissa. En Matlab,
   como en otros lenguajes de programación, esta constante es parte
   del lenguaje y recibe el nombre de *eps*.

.. function:: eps(argin)

   Llamada sin argumentos, la función **eps** devuelve un escalar con
   la precisión numérica de la representación en coma flotante del
   sistema.  Con argumentos devuelve una matriz del tamaño solicitado
   cuyos elementos son dicha precisión.

Para definir escalares enteros disponemos de una colección de
funciones 

.. warning::

   Si bien en Octave existe la función ``single`` el resultado es un
   escalar de doble precisión porque no dispone aún de soporte para
   reales de simple precisión.  La función existe sólo para evitar los
   posibles errores de ejecución.


Matrices
........

Contenedores
------------


.. [IEEE] Definición de esto
