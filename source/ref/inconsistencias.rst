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

¿Qué es una celda?
------------------

Fijémonos en la cabecera de la definición de una función

Funciones y archivos
--------------------

El punto de la muerte
---------------------

Abreviaturas
------------

La innecesaria distinción entre filas y columnas
------------------------------------------------

El punto y coma absurdo
-----------------------

Funciones y sentencias o, cómo ahorrarse paréntesis
---------------------------------------------------



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
