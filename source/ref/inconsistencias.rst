Algunas inconsistencias
=======================

Una vez nombrados todos los elementos propios del lenguaje Matlab, a
falta de tratar la pr��ctica de la programaci��n, es el momento de
aplicar el sentido cr��tico al lenguaje y sacarle los defectos.

Desde un punto de vista puramente formal Matlab es un lenguaje que
arrastra ciertos malos vicios debido a la compatibilidad hacia atr��s.
Es curioso comprobar c��mo, aunque Mathworks ha mostrado todo el
inter��s posible por a��adir al lenguaje las caracter��sticas necesarias
para hacerlo m��s comercial, se han esmerado poco en corregir los
errores del pasado.

Matlab en la ense��anza
----------------------

Soy un firme detractor del uso de Matlab como lenguaje de uso en
cursos de programaci��n. Esta es una opini��n puramente personal pero
est�� s��lidamente fundamentada. 

El objetivo primordial de un curso de programaci��n no es ser
productivo ni aprender c��lculo num��rico.  Desgraciadamente existe el
empe��o generalizado de intentar ense��ar las tres cosas a la
vez. Cuando se cae en ese error se empieza a ver Matlab como una
elecci��n adecuada.

El arte o la pr��ctica de programar es el de manipular datos con
operaciones aritm��ticas para completar una tarea con un
ordenador. Debemos fijarnos que en esta definici��n no aparecen
lenguajes, c��lculo num��rico, matem��ticas... Es algo que uno de los
mayores expertos en el tema, Donald Knuth, sabe perfectamente.  En su
obra enciclop��dica *The Art of Computer Programming* utiliza un
lenguaje inventado de sem��ntica com��n a la mayor��a de lenguajes para
programaci��n estructurada.

Pero ense��ar a programar sin un lenguaje de programaci��n es
terriblemente lento porque obliga a aprender dos veces lo mismo: c��mo
programar y c��mo utilizar un lenguaje de programaci��n as�� que por
brevedad la mayor��a de cursos de programaci��n se basan en aprender a
programar con un lenguaje pero... ��Qu�� lenguaje? Si tuvi��ramos que
escoger uno tomar��amos el que tuviera una sem��ntica lo m��s consistente
posible, sin excepciones ni sutilezas.  Esta no es, de lejos, la mayor
virtud de Matlab.  De hecho es su mayor defecto.

Las lenguas m��s dif��ciles de aprender son las que, con peque��os
cambios en las palabras o la sintaxis, generan significados
completamente distintos.  En el chino, por ejemplo, la palabra que
para un occidental suena como *ma* puede tener hasta cuatro
significados distintos dependiendo de la pronunciaci��n de la vocal. No
es muy distinto del hecho de cambiar el comportamiento de un operador
como la multiplicaci��n (``*``) con otro (``.*``).

A continuaci��n se listan algunas de las caracter��sticas del lenguaje
que deber��an ser eliminadas o modificadas para conseguir una mayor
consistencia. ��Es eso posible? Es muy dif��cil que un lenguaje de
programaci��n salga bien a la primera.  Fortran ha visto nueve
revisiones desde su aparici��n en los cincuenta. Los desarrolladores de
Python se atrevieron a introducir cambios que romp��an todo el c��digo
existente justo durante la revoluci��n de las aplicaciones web con el
��nico objetivo de llevar su filosof��a hasta su ��ltima
consecuencia. Cambiar los lenguajes es posible y en muchos casos es
beneficioso.

Este cap��tulo no pretende influir en Mathworks sino en el
lector. Mitificar cualquier herramienta por fabulosa que pueda parecer
es un grave error.  Mucho m��s cuando la popularidad de Matab hace que
vea usos totalmente inadecuados como la ense��anza de los fundamentos
de la programaci��n.

La verdad sobre la indexaci��n recursiva
---------------------------------------

Matlab hered�� parte de su sintaxis de Fortran, el que fue, es y ser��
el lenguaje del c��lculo cient��fico de altas prestaciones por
excelencia. Una de las particularidades de Fortran respecto al resto
de lenguajes de programaci��n es el tratamiento estricto de las
dimensiones de una matriz.  Este tratamiento se ha reforzado en las
��ltimas revisiones del lenguaje haci��ndolo a��n m��s estricto. Pero hubo
una cosa que los creadores de Matlab no entendieron del todo bien: el
hecho que en Fortran no existan la indexaci��n m��ltiple no significa
que haya matrices en vez de arrays.

El concepto de matriz es una abstracci��n matem��tica mientras que el de
array es un concepto computacional. El segundo parte de la base que en
realidad la memoria es plana, esto es, no tiene filas y columnas. De
hecho, cuando se habla de las diferencias entre C y Fortran siempre se
nombra la manera de ordenar las matrices, algo que profundiza en la
confusi��n.

.. important::

   Como la memoria es plana un array no es m��s que un vector de
   vectores de la misma longitud. Un array de *rango* tres es un
   vector de vectores de vectores.  A la vez un vector es un array de
   escalares.

Si Matlab, como el resto de lenguajes de programaci��n, basara sus
c��lculos en arrays en vez de en matrices el indexado podr��a hacer uso
de la recursividad.

En C las matrices se declaran precisamente haciendo uso de ese concepto

.. code-block:: C

   double array[3][4]

Esta declaraci��n es totalmente equivalente a 

.. code-block:: C

   double array[12]

Python dispone de un m��dulo extra llamado *numpy* y de manera an��loga
a las listas tambi��n utiliza la recursi��n para indexar sus elementos

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
recursi��n de vectores se consigue tanto un sistema para definir arrays
independientemente de las dimensiones como dos maneras alternativas
para indexarlos.

Aqu�� llega una diferencia idiom��tica entre Matlab y Octave,
precisamente una de la que Mathworks deber��a tomar nota. Octave tiene
soporte *limitado* para el indexado recursivo.  Supongamos que tenemos
una funci��n que devuelve una matriz

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

Desgraciadamente no se lleva este concepto hasta la ��ltima
consecuencia para no romper de manera exagerada con la compatibilidad.

.. code-block:: matlab

   octave>> a = [1,2,3;4,5,6;7,8,9];
   octave>> a(1)
   ans =  1
   octave>> a(3)
   ans =  7
   

La innecesaria distinci��n entre filas y columnas
................................................

A diferencia de los arrays, las matrices tienen filas y columnas,
distinci��n importante para las operaciones matriciales.  Por ejemplo,
un producto escalar ser�� la multiplicaci��n matricial entre un vector
fila y otro columna.  Con arrays simplemente es el la suma del
producto de cada elemento.  No es necesario hacer ninguna distinci��n.

Siendo estrictos no es necesario distinguir filas de columnas desde un
punto de vista algebraico, s��lo hay que fijarse si la operaci��n
aumenta, mantiene constante o disminuye el rango.  Podemos definir un
producto escalar o un producto tensorial sin el concepto de matriz, lo
necesitamos si queremos unir ambos en una multiplicaci��n matricial.


��Qu�� es una celda?
------------------

Fij��monos en la cabecera de la definici��n de una funci��n

.. code-block:: matlab

   function [x,y,z] = foo(p,q,r)

Si analizamos sint��cticamente la frase tenemos una sentencia como
``function`` que anuncia la declaraci��n de una funci��n, posteriormente
viene una matriz que contiene tres variables, el operador asignaci��n y
finalmente el enunciado de cabecera de funci��n.

Fij��monos ahora en el elemento ``[x,y,z]``, rigurosamente hablando es
una matriz que contiene tres variables pero en realidad es una
asignaci��n triple.  Esto suele llamarse un triple o un tuple de tres
elementos y es un tipo presente en muchos lenguajes de programaci��n
din��micos. ��Entonces en caso de la asignaci��n m��ltiple los corchetes
designan matrices o tuples?  Vamos a comprobarlo

.. code-block:: matlab

  >> [x,y,z] = [1,2,3]
  ??? Too many output arguments.

Pues ahora parece que lo de la izquierda es un tuple y lo de la
derecha es una matriz. Parece que llegamos a una conclusi��n, cuando
algo delimitado por corchetes est�� al lado izquierdo de una asignaci��n
es un tuple y si est�� en el lado derecho es una matriz.  Hasta que
definimos la funci��n ``foo``

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

��Entonce qu�� retorna una funci��n? La cabecera establece claramente una
asignaci��n triple pero al encontrar s��lo un argumento de salida lo
convierte en una asignaci��n simple e ignora los otros argumentos.
Entonces la cabecera no sirve para nada y establece una jerarqu��a de
argumentos. 

El defecto subyacente es que Matlab no tiene un operador asignaci��n
completamente consistente que establece la excepci��n de las llamadas a
funciones. Este defecto podr��a solucionarse si los *cell arrays*
se comportaran como tuples y soportaran la asignaci��n
m��ltiple. Uniendo lo anterior a que las funciones tuvieran a celdas
como argumentos de salida podr��amos arreglar ese defecto en el
operador asignaci��n. Este ser��a un ejemplo del declaraci��n.

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

   >> x = foo(1,2,3)(1)
   x = 
        1

��Qu�� son entonces los cell arrays?  Paraecen una manera un poco m��s
sofisticada de ordenar valores pero es dif��cil encontrar el por qu�� de
su existencia.  Permitiendo la asignaci��n m��ltiple con cell arrays y
la indexaci��n m��ltiple se podr��a dotar al operador asignaci��n de un
significado verdadero.

Funciones y archivos
--------------------

��Cu��l es el paradigma de Matlab?
................................

La orientaci��n a objetos
........................

El punto de la muerte
---------------------

El punto y coma absurdo
-----------------------

Funciones y sentencias o c��mo ahorrarse par��ntesis
--------------------------------------------------

Hay una distinci��n fundamental entre funciones y sentencias. Una
sentencia, como lo es ``for`` o ``if`` son partes del lenguaje y se
encargan del control de flujo de ejecuci��n. Una funci��n encapsula una
tarea, no es m��s que un bloque de ejecuci��n.

En algunos casos, cuando una funci��n es muy habitual y penalizando la
consistencia, se convierte en una sentencia pero sigue siendo una
funci��n porque se llama con argumentos.

En Matlab existen dos casos paradigm��ticos que rompen totalmente con
la sintaxis con la ��nica finalidad de ahorrarse un par de par��ntesis y
un par de comillas como ``hold`` y ``print``.

Fij��monos en el uso de la sentencia ``hold``.  Si quiere activarse el
redibujo se escribe

.. code-block:: matlab

   hold on

Para alguien que no hubiera visto nunca Matlab esto es una sentencia
que recibe una variable como argumento.  Ni *hold* es una sentencia ni
*on* es una variable.

``print`` es de patolog��a m��s severa.  Aunque puede llamarse como una
funci��n est�� dise��ado para ser llamado como un comando de consola al
estilo UNIX.  Las opciones se pasan con el prefijo ``-``, algo que
parecer�� habitual a los usuarios de los sistemas operativos serios. Lo
m��s grave es que, cuando *print* se llama como funci��n los argumentos
tambi��n deben utilizar el mismo prefijo.

.. important::

  Uno de los muchos motivos de la transici��n entre Python 2 y Python 3
  fue precisamente la sentencia ``print``. Imprimir en la consola es
  una funci��n tan utilizada que en algunos lenguajes tiene el estatus
  especial de sentencia, *pero es una excepci��n*. Si uno de tus
  objetivos es buscar la m��xima consistencia debes cumplirlo
  eliminando las excepciones de tu lenguaje.  En Python 3 ``print`` es
  una funci��n y debe llamarse con argumentos.  Este cambio
  aparentemente nimio significa romper pr��cticamente todo el c��digo
  escrito hasta la ��poca, aunque en este caso portarlo sea trivial.
  Aunque sean menos evidentes los otros cambios causaron peores
  dolores de cabeza.

El motivo de la conversi��n de funciones en sentencias es obtener mayor
brevedad al escribir una frase muy habitual.  Una llamada consistente
ser��a

.. code-block:: matlab

   hold(true)

.. [KNU] Donald E. Knuth. The Art Of Computer Programming. http://www-cs-faculty.stanford.edu/~knuth/taocp.html

.. [OLI] Travis Oliphant.  Guide to Numpy.  http://scipy.org
