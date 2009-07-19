Introducción
^^^^^^^^^^^^

¿Qué es Matlab?
===============

Matlab es un lenguaje de programación específicamente diseñado para el
Cálculo Numérico.  En la práctica podemos definirlo también diciendo
que es el conjunto de herramientas que Mathworks distribuye para
programar en Matlab.

A diferencia de la mayoría de lenguajes de programación no existe
ningún estándar que lo rija, técnicamente el lenguaje Matlab es tal
como se distribuye en su última versión.

Pero lo realmente valioso de Matlab no son sus capacidades como
lenguaje sino las siguientes:

* Existe un uso generalizado de Matlab en Ingeniería, es una
  herramienta de gran popularidad y es útil para una carrera
  profesional. Esto lo ha convertido en un estándar de-facto para la
  escritura de pequeños programas de simulación.

* Matlab cuenta con una extensa biblioteca de funciones que cubren
  casi todas las disciplinas de la Ciencia y la Ingeniería
  extensamente documentada y de fácil uso.

El producto que recibe el nombre de Matlab consta esencialmente de dos
partes: un intérprete y un editor.

El intérprete
-------------

Antes de hablar del intérprete del lengaje Matlab es imprescindible
entender algunas de las características de los lenguajes de
programación.

Los lenguajes de programación, como los lenguajes naturales escritos,
no son más que una serie de normas para transmitir conceptos.  Mientras
el lenguaje escrito sirve para que los seres humanos se comuniquen
entre ellos los lenguajes de programación se crearon para comunicarse
con los ordenadores mediante una serie finita de claves.

Los lenguajes de programación también tienen gramática y léxico pero
son mucho más simples que, por ejemplo, los de la lengua
castellana. Los seres humanos estamos educados para convertir palabras
y frases en sonidos. Hay que dotar a los ordenadores de un método para
convertir el código implementado en un lenguaje de programación en
órdenes que sea capaz de cumplir. Hay casi una infinidad de maneras de
lograr este objetivo.  A diferencia de la mayoría de los cursos sobre
lenguajes de programación los describiremos por orden cronológico,
aunque no rigurosamente.

Cuando apareció el ordenador programable la única manera de
comunicarse con él era describir sin ambigüedad qué sucedía con cada
posición de memoria.  Este código de bajo nivel, llamado comúnmente
ensamblador, es traducido a lenguaje máquina que ya un ordenador es
capaz de entender.  Aunque hoy este método de programación pueda
parecer inverosímil es la mejor manera de mover máquinas lentas y con
poca memoria como las de entonces.

El paso siguiente llegó con la aparición de los compiladores.  A
medida que los ordenadores se hacían más potentes escribir los
programas en ensamblador empezó a hacerse una tarea muy laboriosa. El
número de direcciones de memoria crecía exponencialmente y las
arquitecturas, aunque seguían el modelo de Von Neumann, se hacían más
complejas.  El siguiente paso fue utilizar el mismo ordenador para
traducir desde un lenguaje más humano, de alto nivel, a ensamblador.
El ensamblador pasó de ser un lenguaje de uso a un léxico intermedio.
El programa que convierte este código de alto nivel se llama
compilador.

Este planteamiento tiene una ventaja adicional. El código ensamblador
no es el mismo para todas las arquitecturas.  Un programa compilado
para x86 no puede ejecutarse en SPARC o POWER pero el código es el
mismo. El programa de Kernighan y Ritchie [KnR]_

.. code-block:: c

   #include "stdio.h"
   
   int main()
   {
     printf("Hello, world!\n");
   }

Produce exactamente el mismo resultado en cualquier ordenador siempre
que disponga de un compilador de lenguaje C. Esto asegura la
portabilidad a nivel de código, no a nivel de ejecutable.   

El paso siguiente es poder utilizar un ensamblador independiente de
cada arquitectura mediante un traductor de código propio a código
máquina.  Esta aplicación se llama *máquina virtual*. Una máquina
virtual es tan lista como se desee (mucho más lista que un procesador)
y realizará tareas como la declaración de variables, la liberación de
memoria o la gestión del flujo de ejecución. El conjunto compilador y
máquina virtual se denomina intérprete y los lenguajes que soportan
este funcionamiento se llaman *lenguajes interpretados*.  Que el
código sea ejecutado por un programa y no por el propio ordenador es
mucho más lento, por este motivo las máquinas virtuales no se
popularizaron hasta finales de los noventa.

El paso siguiente es hacer desaparecer incluso este ensamblador
intermedio y con él el compilador.  Ya no existe un compilador y una
máquina virtual sino que sólo un programa, el intérprete, realiza todo
el trabajo.  Este último planteamiento no es necesariamente superior
en eficacia o rendimiento a una máquina virtual, simplemente es más
fácil de diseñar e implementar.  Matlab pertenece a este último grupo.

Lenguajes estáticos y dinámicos
...............................

En muchos lenguajes de programación como C o Fortran es imprescindible
declarar cada variable.  La definición estricta de declaración es la
de identificar un determinado espacio en la memoria del ordenador con
un nombre.  Volviendo otra vez a un C que cualquiera pueda entender la
declaración

.. code-block:: c

   int a;

significa que un espacio en la memoria física lo suficientemente
grande como para almacenar un entero va a recibir el nombre de
``a``. Estos lenguajes, los que asocian variables a memoria, se llaman
*estáticos*

La llegada de los lenguajes interpretados permitió manejar la memoria
de una manera mucho más versátil. Java, que aunque es interpretado es
también estático, incluye un recolector de basura que descarga al
programador de la tarea de limpiar la memoria. Pero la mayoría de los
lenguajes interpretados modernos como Python o Ruby son además
*dinámicos*.  En un lenguaje dinámico no existen declaraciones porque
el concepto de variable es distinto, *ya no es el nombre que se asocia
a un espacio en la memoria, es el nombre de un valor*. De esta manera
la variable tiene un sentido mucho más natural, más matemático. Matlab
es un lenguaje dinámico aunque no puede considerarse moderno.

Desde el punto de vista del intérprete cualquier variable o
estructuras de variables son mutables en tiempo de ejecución
complicando significativamente el manejo de memoria.

Programar con un lenguaje dinámico es completamente distinto hacerlo
con uno estático.  La mayor versatilidad suele venir acompañada de
mayor coste computacional o de nuevos errores de programación. No
debemos perder nuca de vista que la programación es la manipulación de
datos almacenados en la memoria de un ordenador y con un lenguaje
dinámico estamos más lejos de los mismos.

Otros intérpretes de lenguaje Matlab
....................................

Matlab es sólo un lenguaje, nada liga un lenguaje a un intérprete en
concreto. El lenguaje de programación C++ cuenta con casi medio
centenar de compiladores distintos al igual que Java puede ejecutarse
en más de una máquina virtual, incluso Microsoft creó una propia.
Nada impide programar un intérprete de lenguaje Matlab distinto del
distribuido por Mathworks.

Octave, como Freemat o Scilab nació como un producto para cálculo
numérico con un lenguaje de programación propio pero con un
funcionamiento idéntico al de Matlab. Los objetivos del proyecto
fueron cambiando progresivamente hasta convertirse en un intérprete
capaz de evaluar casi la totalidad del código escrito en Matlab.
Incluso soporta ciertas extensiones muy cómodas que podrían
perfectamente ser incorporadas en el inérprete *oficial*.

Octave es libre y gratuito y es una plataforma para cálculo numérico
que merece ser tenida en cuenta.  Uno de los objetivos de este libro
es que pueda seguirse en su totalidad independientemente del
intérprete elegido. Cada vez que se utilice alguna característica que
no sea común se hará previa advertencia.

Al igual que Matlab, Octave soporta sin grandes diferencias los tres
sistemas operativos más comunes: Windows, Linux y MacOS.

El editor
---------

Un editor es un programa diseñado especialmente para escribir
código. Escribir código fuente no se parece en nada a redactar un
informe o escribir una novela, no parece lógico utilizar la misma
herrameinta para ambas tareas.  Un buen editor nos ayudará a sangrar
bloques, coloreará las palabras clave, nos avisará si cometemos algún
error evidente...

Una parte muy importante del entorno de desarrollo Matlab es el editor
diseñado específicamente para el lenguaje.  Esto no significa que sea
la única posibilidad, casi la totalidad de editores de texto disponen
de macros o modos dedicados a la programación en Matlab.  Si ya
estamos acostumbrados a usar Emacs, Nedit o Vim no será necesario que
cambiemos de editor porque todas las características deseables ya
están incluidas en la distribución habitual.

IDE
---

Es el acrónimo de *Integrated Development Environment*. Cuando en una
misma aplicación gráfica se incluyen intérprete, consola interactiva,
editor, cronología de comandos, visor de documentación, gestor de
archivos y debugger se hace con la intención que no se tenga que
utilizar ninguna aplicación externa.  El producto Matlab es, si se
busca una definición estricta, un IDE para la programación en lenguaje
Matlab.


.. [KnR] El Lenguaje de Programación C. Brian W. Kernighan, Dennis M. Ritchie. Pearson Educación (2ª Ed. 1991)
