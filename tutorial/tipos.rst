Tipos numéricos
---------------

Escalares
.........

Matlab soporta los tipos escalares enteros y reales presentes en la
mayoría de arqutecturas: enteros de 8, 16, 32 y 64 bits y reales de
simple y doble precisión.

.. warning::

   Nunca hay que olvidar que cualqier literal numérico será
   considerado un real de doble precisión.

Los reales de doble precisión definidos por IEEE son los números
entre el 2.2251e-308 al 1.7977e+308 con una precisión de
aproximadamente 2.2204e-16, esto es, dieciseis cifras
significativas. Este número depende de la arquitectura del ordenador y
de si éste soporta o no la aritmética en coma flotante de 64 bits de
IEEE.  Esta colección de números debería ser suficiente para expresar
cualquier cantidad con sentido físico puesto que los límites son
superiores al número de átmos del universo y la precisión está cerca
de la longitud de Planck en el sistema métrico decimal.

Los escalares pueden sumarse, restarse, dividirse, elevarse a la
enésima potencia... Matlab proporciona prácticamente cualquier
operación aritmética escalar imaginable.  Además, operar con escalares
es una tarea muy intuitiva y puede tanto con literales como con
variables.

.. code-block:: matlab

   >> 2+2 
   ans =
        4
   >> a = 1234.1234^2;
   >> sqrt(a+325.312) %Raíz cuadrada.
   ans =
      1.2343e+03
   
.. important::

   En el Cálculo Numérico no hay más remedio que expresar números
   reales mediante datos con precisión limitada.  El concepto de
   precisión numérica se hace a veces incómodo cuando uno espera un
   resultado exacto como puede ser 0 o :math:`\sqrt{2}`.  Nunca hay
   que perder de vista que la representación de un número :math:`\phi`
   será siempre :math:`\varphi \pm \epsilon` donde :math:`\epsilon` es
   el error debido a la naturaleza finita de la mantissa. En Matlab,
   como en otros lenguajes de programación, esta constante es parte
   del lenguaje y recibe el nombre de *eps*. Técnicamente este *eps*
   es un cero.  Existe una duda recurrente de por qué algunas
   operaciones que deberían tener un cero estricto como resultado
   devuelven un número muy pequeño pero distinto de cero.  El paso
   siguiente es cometer el error de pensar que esto es un
   funcionamiento anómalo.  Es muy importante que las operaciones en
   las que se pierde precisión numérica (resta y división) dispongan
   de un mecanismo para mostrar estos síntomas.  Convertir estos *eps*
   en cero sería un error aún mayor porque algunas veces es importante
   saber si se trata en realidad de un número muy pequeño.

.. function:: eps(argin)

   Llamada sin argumentos, la función *eps* devuelve un escalar con la
   precisión numérica de la representación en coma flotante del
   sistema.  Con argumentos devuelve una matriz del tamaño solicitado
   cuyos elementos son dicha precisión.

Para definir escalares enteros disponemos de una colección de
funciones 

.. function:: cast(argin)
   
   Cambia el tipo de la variable de entrada sin modificar los datos en
   memoria.

Matrices
--------

El tipo de referencia en Matlab es la matriz.  Es algo que podemos
deducir de su nombre.  Es bastante difícil dar una definición estricta
puesto que conceptualmente se acerca más al Álgebra Lineal que a los
otros lenguajes de programación.  Una definición intuitiva y simple es
la siguiente: *en Matlab una matriz es un conjunto de escalares
ordenados en columnas de igual longitud*.  Esta definición es dual
puesto que puede decirse también que *en Matlab una matriz es un
conjunto de escalares ordenados en filas de igual longitud*.

Vectores
........

Técnicamente no existen los vectores en Matlab.  Son matrices con una
única fila o una única columna.  No pensar en los vectores como un
tipo a parte es importante para no cometer errores intentando operar
variables con tamaños incompatibles.

Matrices de dimensiones mayores que 2
.....................................

Contenedores
------------

Estructuras
...........

Celdas
......

Function handles
................
