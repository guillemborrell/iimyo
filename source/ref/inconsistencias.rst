Algunas inconsistencias
=======================

Una vez nombrados todos los elementos propios del lenguaje Matlab, a
falta de tratar la práctica de la programación, es el momento de
aplicar el sentido crítico al lenguaje y sacarle los defectos.

Desde un punto de vista puramente formal Matlab es un lenguaje que
arrastra ciertos malos vicios debido a la compatibilidad hacia atrás.
Es curioso comprobar cómo, aunque Mathworks ha mostrado todo el
interés posible por añadir al lenguaje las características necesarias
para hacerlo más comercial, se han esmerado poco en corregir los
errores del pasado.

Matlab en la enseñanza
----------------------

Soy un firme detractor del uso de Matlab como lenguaje de uso en
cursos de programación. Esta es una opinión puramente personal pero
está sólidamente fundamentada. 

El objetivo primordial de un curso de programación no es ser
productivo ni aprender cálculo numérico.  Desgraciadamente existe el
empeño generalizado de intentar enseñar las tres cosas a la
vez. Cuando se cae en ese error se empieza a ver Matlab como una
elección adecuada.

El arte o la práctica de programar es el de manipular datos con
operaciones aritméticas para completar una tarea con un
ordenador. Debemos fijarnos que en esta definición no aparecen
lenguajes, cálculo numérico, matemáticas... Es algo que uno de los
mayores expertos en el tema, Donald Knuth, sabe perfectamente.  En su
obra enciclopédica *The Art of Computer Programming* utiliza un
lenguaje inventado de semántica común a la mayoría de lenguajes para
programación estructurada.

Pero enseñar a programar sin un lenguaje de programación es
terriblemente lento porque obliga a aprender dos veces lo mismo: cómo
programar y cómo utilizar un lenguaje de programación así que por
brevedad la mayoría de cursos de programación se basan en aprender a
programar con un lenguaje pero... ¿Qué lenguaje? Si tuviéramos que
escoger uno tomaríamos el que tuviera una semántica lo más consistente
posible, sin excepciones ni sutilezas.  Esta no es, de lejos, la mayor
virtud de Matlab.  De hecho es su mayor defecto.

Las lenguas más difíciles de aprender son las que, con pequeños
cambios en las palabras o la sintaxis, generan significados
completamente distintos.  En el chino, por ejemplo, la palabra que
para un occidental suena como *ma* puede tener hasta cuatro
significados distintos dependiendo de la pronunciación de la vocal. No
es muy distinto del hecho de cambiar el comportamiento de un operador
como la multiplicación (``*``) con otro (``.*``).

A continuación se listan algunas de las características del lenguaje
que deberían ser eliminadas o modificadas para conseguir una mayor
consistencia. ¿Es eso posible? Es muy difícil que un lenguaje de
programación salga bien a la primera.  Fortran ha visto nueve
revisiones desde su aparición en los cincuenta. Los desarrolladores de
Python se atrevieron a introducir cambios que rompían todo el código
existente justo durante la revolución de las aplicaciones web con el
único objetivo de llevar su filosofía hasta su última
consecuencia. Cambiar los lenguajes es posible y en muchos casos es
beneficioso.

Este capítulo no pretende influir en Mathworks sino en el
lector. Mitificar cualquier herramienta por fabulosa que pueda parecer
es un grave error.  Mucho más cuando la popularidad de Matab hace que
vea usos totalmente inadecuados como la enseñanza de los fundamentos
de la programación.

La verdad sobre la indexación recursiva
---------------------------------------

Matlab heredó parte de su sintaxis de Fortran, el que fue, es y será
el lenguaje del cálculo científico de altas prestaciones por
excelencia. Una de las particularidades de Fortran respecto al resto
de lenguajes de programación es el tratamiento estricto de las
dimensiones de una matriz.  Este tratamiento se ha reforzado en las
últimas revisiones del lenguaje haciéndolo aún más estricto. Pero hubo
una cosa que los creadores de Matlab no entendieron del todo bien: el
hecho que en Fortran no existan la indexación múltiple no significa
que haya matrices en vez de arrays.

El concepto de matriz es una abstracción matemática mientras que el de
array es un concepto computacional. El segundo parte de la base que en
realidad la memoria es plana, esto es, no tiene filas y columnas. De
hecho, cuando se habla de las diferencias entre C y Fortran siempre se
nombra la manera de ordenar las matrices, algo que profundiza en la
confusión.

.. important::

   Como la memoria es plana un array no es más que un vector de
   vectores de la misma longitud. Un array de *rango* tres es un
   vector de vectores de vectores.  A la vez un vector es un array de
   escalares.

Si Matlab, como el resto de lenguajes de programación, basara sus
cálculos en arrays en vez de en matrices el indexado podría hacer uso
de la recursividad.

En C las matrices se declaran precisamente haciendo uso de ese concepto

.. code-block:: c

   double array[3][4]

Esta declaración es totalmente equivalente a 

.. code-block:: c

   double array[12]

Python dispone de un módulo extra llamado *numpy* y de manera análoga
a las listas también utiliza la recursión para indexar sus elementos

.. code-block:: python

   In [1]: from numpy import array

   In [2]: a = array([[1,2,3],[4,5,6],[7,8,9]])
   
   In [3]: a[0]
   Out[3]: array([1, 2, 3])
   
   In [4]: a[0][0]
   Out[4]: 1
   
   In [5]: a[0,0]
   Out[5]: 1
   
A riesgo de parecer reiterativo, definiendo un array como una
recursión de vectores se consigue tanto un sistema para definir arrays
independientemente de las dimensiones como dos maneras alternativas
para indexarlos.

Aquí llega una diferencia idiomática entre Matlab y Octave,
precisamente una de la que Mathworks debería tomar nota. Octave tiene
soporte *limitado* para el indexado recursivo.  Supongamos que tenemos
una función que devuelve una matriz

.. code-block:: matlab

   function y = foo(x)
     
     y = [x,2*x,3*x];

Sabiendo lo anterior podemos indexar el resultado junto con la llamada

.. code-block:: matlab

   octave>> z = foo(2)(2)
   z =  4

Esto sucede con cualquier llamada que devuelva una matriz como resultado

.. code-block:: matlab

   octave>> y = {[1,2,3],[4,5,6]};
   octave>> y{1}(2)
   ans =  2

Desgraciadamente no se lleva este concepto hasta la última
consecuencia para no romper de manera exagerada con la compatibilidad.

.. code-block:: matlab

   octave>> a = [1,2,3;4,5,6;7,8,9];
   octave>> a(1)
   ans =  1
   octave>> a(3)
   ans =  7
   

La innecesaria distinción entre filas y columnas
................................................

A diferencia de los arrays, las matrices tienen filas y columnas,
distinción importante para las operaciones matriciales.  Por ejemplo,
un producto escalar será la multiplicación matricial entre un vector
fila y otro columna.  Con arrays simplemente es el la suma del
producto de cada elemento.  No es necesario hacer ninguna distinción.

Siendo estrictos no es necesario distinguir filas de columnas desde un
punto de vista algebraico, sólo hay que fijarse si la operación
aumenta, mantiene constante o disminuye el rango.  Podemos definir un
producto escalar o un producto tensorial sin el concepto de matriz, lo
necesitamos si queremos unir ambos en una multiplicación matricial.


¿Qué es una celda?
------------------

Fijémonos en la cabecera de la definición de una función

.. code-block:: matlab

   function [x,y,z] = foo(p,q,r)

Si analizamos sintácticamente la frase tenemos una sentencia como
``function`` que anuncia la declaración de una función, posteriormente
viene una matriz que contiene tres variables, el operador asignación y
finalmente el enunciado de cabecera de función.

Fijémonos ahora en el elemento ``[x,y,z]``, rigurosamente hablando es
una matriz que contiene tres variables pero en realidad es una
asignación triple.  Esto suele llamarse un triple o un tuple de tres
elementos y es un tipo presente en muchos lenguajes de programación
dinámicos. ¿Entonces en caso de la asignación múltiple los corchetes
designan matrices o tuples?  Vamos a comprobarlo

.. code-block:: matlab

  >> [x,y,z] = [1,2,3]
  ??? Too many output arguments.

Pues ahora parece que lo de la izquierda es un tuple y lo de la
derecha es una matriz. Parece que llegamos a una conclusión, cuando
algo delimitado por corchetes está al lado izquierdo de una asignación
es un tuple y si está en el lado derecho es una matriz.  Hasta que
definimos la función ``foo``

.. code-block:: matlab
   
   function [x,y,z] = foo(p,q,r)
     x = p;
     y = q;
     z = r;

Y probamos lo siguiente

.. code-block:: matlab

   >> x = foo(1,2,3)
   x =
        1

¿Entonce qué retorna una función? La cabecera establece claramente una
asignación triple pero al encontrar sólo un argumento de salida lo
convierte en una asignación simple e ignora los otros argumentos.
Entonces la cabecera no sirve para nada y establece una jerarquía de
argumentos. 

El defecto subyacente es que Matlab no tiene un operador asignación
completamente consistente que establece la excepción de las llamadas a
funciones. Este defecto podría solucionarse si los *cell arrays*
se comportaran como tuples y soportaran la asignación
múltiple. Uniendo lo anterior a que las funciones tuvieran a celdas
como argumentos de salida podríamos arreglar ese defecto en el
operador asignación. Este sería un ejemplo del declaración.

.. code-block:: matlab

   function {x,y,z} = foo(p,q,r}
     x = p;
     y = q;
     z = r;

Y este su funcionamiento

.. code-block:: matlab

   >> foo(1,2,3)
   ans =    
       [1]    [2]    [3]

   >> {x,y,z} = foo(1,2,3)
   x = 
        1

   y =
        2
   
   z =
        3

   >> x = foo(1,2,3)
   ??? Not enough output arguments.

   >> x = foo(1,2,3){1}
   x = 
        1

¿Qué son entonces los cell arrays?  Paraecen una manera un poco más
sofisticada de ordenar valores pero es difícil encontrar el por qué de
su existencia.  Permitiendo la asignación múltiple con cell arrays y
la indexación múltiple se podría dotar al operador asignación de un
significado verdadero.

Funciones y archivos
--------------------

¿Cuál es el paradigma de Matlab?
................................

La orientación a objetos
........................

El punto de la muerte
---------------------

El punto y coma absurdo
-----------------------

Funciones y sentencias o cómo ahorrarse paréntesis
--------------------------------------------------

Hay una distinción fundamental entre funciones y sentencias. Una
sentencia, como lo es ``for`` o ``if`` son partes del lenguaje y se
encargan del control de flujo de ejecución. Una función encapsula una
tarea, no es más que un bloque de ejecución.

En algunos casos, cuando una función es muy habitual y penalizando la
consistencia, se convierte en una sentencia pero sigue siendo una
función porque se llama con argumentos.

En Matlab existen dos casos paradigmáticos que rompen totalmente con
la sintaxis con la única finalidad de ahorrarse un par de paréntesis y
un par de comillas como ``hold`` y ``print``.

Fijémonos en el uso de la sentencia ``hold``.  Si quiere activarse el
redibujo se escribe

.. code-block:: matlab

   hold on

Para alguien que no hubiera visto nunca Matlab esto es una sentencia
que recibe una variable como argumento.  Ni *hold* es una sentencia ni
*on* es una variable.

``print`` es de patología más severa.  Aunque puede llamarse como una
función está diseñado para ser llamado como un comando de consola al
estilo UNIX.  Las opciones se pasan con el prefijo ``-``, algo que
parecerá habitual a los usuarios de los sistemas operativos serios. Lo
más grave es que, cuando *print* se llama como función los argumentos
también deben utilizar el mismo prefijo.

.. important::

  Uno de los muchos motivos de la transición entre Python 2 y Python 3
  fue precisamente la sentencia ``print``. Imprimir en la consola es
  una función tan utilizada que en algunos lenguajes tiene el estatus
  especial de sentencia, *pero es una excepción*. Si uno de tus
  objetivos es buscar la máxima consistencia debes cumplirlo
  eliminando las excepciones de tu lenguaje.  En Python 3 ``print`` es
  una función y debe llamarse con argumentos.  Este cambio
  aparentemente nimio significa romper prácticamente todo el código
  escrito hasta la época, aunque en este caso portarlo sea trivial.
  Aunque sean menos evidentes los otros cambios causaron peores
  dolores de cabeza.

El motivo de la conversión de funciones en sentencias es obtener mayor
brevedad al escribir una frase muy habitual.  Una llamada consistente
sería

.. code-block:: matlab

   hold(true)

.. [KNU] Donald E. Knuth. The Art Of Computer Programming. http://www-cs-faculty.stanford.edu/~knuth/taocp.html

.. [OLI] Travis Oliphant.  Guide to Numpy.  http://scipy.org
