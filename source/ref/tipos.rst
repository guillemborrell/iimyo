Tipos, operadores y expresiones
===============================

Antes de empezar, un poco de formalismo.  Tomemos la siguiente expresión

.. code-block:: matlab

   >> a = 1;

La línea de código anterior tiene tres símbolos:

* ``a`` es una variable

* ``=`` es el operador asignación.  

* ``1`` es el literal que da el valor a la asignación.

Una variable puede tener cualquier nombre, independientemente de la
longitud, siempre que no empiece por un número ni contenga ninguno de
los símbolos reservados para el propio lenguaje como ``+``, ``-``,
``:``... Se recomienda encarecidamente, y en esto Matlab no se
distingue de ningún lenguaje de programación, utilizar nombres de
variables descriptivos y tener mucho cuidado con la brevedad.

.. important::

   Matlab distingue entre minúsculas y mayusculas, esto es, los
   nombres ``v`` y ``V`` designan variables distintas.

El operador asignación simlemente carga el valor de lo que se
encuentre a la derecha en la variable de la izquierda.  Cualquier
cálculo aritmético que no contenga una asignación mostrará en pantalla
el resultado y lo asignará a una variable reservada llamada ``ans``

.. code-block:: matlab

   >> 2 + 2

   ans = 4

   >> ans + 2

   ans = 6

Caracteres especiales
---------------------

Antes de entrar en el tema de los literales analizaremos una pieza que
bien ha podido pasar inadvertida, el punto y coma final.  Matlab
dispone de convenciones para modificar ligeramente el comportamiento
del intérprete.

El más básico es el punto y coma.  Introducido al final de la línea
inhibe al intérprete de mostrar el resultado por pantalla.  Esto no
significa que el resultado práctico no sea el mismo.  La línea se
ejecuta sin ninguna diferencia y si no existe asignación el resultado
se carga en la variable ``ans``.

Los comentarios se introducen mediante el símbolo de porcentaje
``%``. No hay ninguna manera de especificar bloques comentados como en
C.

.. warning::

   Octave conserva, de cuando no intentaba ser plenamente compatible
   con Matlab, el antiguo símbolo de comentario ``#``. Debemos ser
   conscientes que al utilizarlo estamos destruyendo la portabilidad
   entre ambos intérpretes

.. note::

   Hay un par de trucos con los comentarios en Matlab que ayudan a
   organizar los scripts.  Si se escribe una línea con una generosa
   cantidad de comentarios dividirá el archivo en bloques, Matlab
   llama a eso *Cell mode*.  Si antes del texto se escriben dos
   símbolos de comentario la línea aparaecerá en negrita.

.. note::

   Hay multitud de editores capaces de colorear el código Matlab e
   incluso capaces de echarnos una mano al ejecutar scripts y
   comunicarnos con el intérprete.  Los usuarios de Emacs cuentan
   tanto con un modo Octave como con un modo Matlab.  Desgraciadamente
   los archivos *.m* inician el modo para programar en objective C.

Las continuaciones de línea se expresan con la sucesión de tres puntos
``...``.  Este ejemplo sería sintácticamente correcto

.. code-block:: matlab

   >> a = ...
   2 ...
   + 2

   a = 4

.. important::

   Una ley no escrita de la programación que parece olvidarse
   progresivamente es la sana práctica de no excederse de 80 columnas
   en el código.  La mayoría de los editores nos avisan de algún modo
   de esta convención pero no nos impiden escribir líneas más largas.
   El editor de Matlab nos marca el límite con una sutil línea
   vertical.  Hace ya unos cuantos años los compiladores se negaban a
   entender más allá del caracter 80 porque era el ancho del terminal
   UNIX.

.. warning::

   Octave también conserva su anterior símbolo de continuación de
   línea por compatibilidad hacia atrás, la contrabarra ``\``.  Se
   trata de un error sintáctico porque existe un operador que utiliza
   el mismo símbolo.

Literales
---------

En programación todo tiene un tipo porque el ordenador no entiende
mucho de ambigüedades. Un entero no es lo mismo que un escalar en coma
flotante o una cadena de caracteres porque no los almacena físicamente
en su memoria de la misma manera. Este funcionamiento interno se
esconde en la práctica pero deja su huella en el lenguaje. No se
diferencia entre enteros y escalares en coma flotante como formalismo
matemático sino para que el lenguaje exprese las diferencias
esenciales entre ambos.

Estas distinciones provocan un problema secundario, un programa es un
conjunto de caracteres ASCII (Matlab incluso soporta en parte
Unicode).  ¿Cómo puedo distinguir entre un escalar entero y en coma
flotante? ¿Y una cadena de caracteres?

Matlab tiene un conjunto de literales muy limitado, sólo podemos
introducir escalares en coma flotante de doble precisión y cadenas de
caracteres. Cualquier otro tipo tendrá que generarse a través de las
funciones de conversión correspondientes.

.. function:: class(argin)

   Devuelve como cadena de caracteres el tipo de *argin*

Para los habituales de otros lenguajes de programación esta línea de
código les parecerá sorprendente.

.. code-block:: matlab

   >> class(1)

  ans = double

Las cadenas de caracteres se introducen entre comillas simples

.. code-block:: matlab

   >> say = 'hello'

   say = hello

.. warning::

   Octave, también por motivos de compatibilidad, soprta utilizar la
   comilla doble como delimitador de cadenas de caracteres.

Octave cuenta adicionalmente con las cifras hexadecimales como
literal.  Es útil cuando, al escribir extensiones en C o C++ se tenga
que hacer aritmética de punteros.

.. code-block:: matlab

   octave>> 0x5662a4
   ans =  5661348

Matlab como lenguaje interpretado
---------------------------------

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

   (Octave) Imprime en la pantalla el tipo del resultado de la
   expresión *expr*.  Si no se da ningún argumento lista todos los
   tipos disponibles

.. function:: whos('str')
   
   Cuando *str* es el nombre de una variable como cadena de caracteres
   devuelve la información correspondiente a la misma que incluye sus
   dimensiones, el tamaño en memoria, el tipo y los atributos.  Si se
   utiliza como sentencia devuelve la información de todas las
   funciones presentes en el espacio de variables,

.. note::

   Ver en la sección destinada a funciones en concepto de Duck Typing.


Tipos numéricos
---------------

Escalares
.........

Matlab soporta los tipos escalares enteros y reales presentes en la
mayoría de arqutecturas: enteros de 8, 16,32 y 64 bits y reales de
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


.. function:: cast(argin)
   
   A comentar

Matrices
........

Contenedores
------------

Estructuras
...........

Celdas
......

Function handles
................
