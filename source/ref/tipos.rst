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
la unión entre la variable y su valor es mucho más débil en los
lenguajes estáticos donde la declaración es imprescindible.

.. code-block:: matlab

   >> a = 1;
   >> a = [1,2,3,4]
   a = 

      1  2  3  4

El tipo asignado a la variable ``a`` a través del literal no es
inmutable, como se dice en el párrafo anterior, basta con crear una
nueva asignación para dar a la variable un uso completamente distinto.

Podemos imaginar las variables en los lenguajes dinámicos como un
simple nombre para manipular lo que se ha creado mediante el operador
asignación ya sea a través de un literal o de otras expresiones.

.. function:: typeinfo(expr)

   Imprime en la pantalla el tipo del resultado de la expresión
   *expr*.  Si no se da ningún argumento lista todos los tipos
   disponibles


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

PUNTO DE ESCRITURA

.. warning::

   Si bien en Octave existe la función ``single`` el resultado es un
   escalar de doble precisión porque no dispone aún de soporte para
   reales de simple precisión.  La función existe sólo para evitar los
   posibles errores de ejecución.


Matrices
........

Estructuras de datos
--------------------

Cell arrays
-----------
