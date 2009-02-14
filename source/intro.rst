¿Qué es Matlab?
===============

Esta pregunta tiene varias respuestas dependiendo del detalle que se
solicite.  Siendo informales se puede decir que Matlab es un producto
de software orientado a Ciencia e Ingeniería que comercializa
Mathworks. Esta definición es útil pero incorrecta porque Matlab es un
lenguaje de programación, se está definiendo el todo por la
parte. Este error es perfectamente comprensible porque con sólo un
lenguaje de programación es imposible producir nada. Para convertir
algoritmos en programas Matlab necesita como mínimo lo siguiente:

* Un intérprete

* Un editor

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
poca memoria como las de entonces.  El paso siguiente fue la aparición
del compilador.  A medida que los ordenadores se hacían más potentes
escribir los programas en ensamblador empezó a hacerse una tarea muy
laboriosa.  El siguiente paso fue utilizar el mismo ordenador para
traducir desde un lenguaje más natural, de alto nivel, a ensamblador;
esto es, utilizar el ensamblador como lenguaje intermedio.  El
programa que convierte este código más "humano" se llama compilador.
Este planteamiento tiene un pequeño problema: el código ensamblador no
es el mismo para todas las arquitecturas.  Un programa compilado para
x86 no puede ejecutarse en SPARC o POWER. El paso siguiente es poder
utilizar un ensamblador independiente de cada arquitectura, un
traductor de código propio a código máquina.  Esta aplicación se llama
*máquina virtual*.  Con una máquina virtual el compilador traduce del
lenguaje de alto nivel a ese código propio.  Una máquina virtual es
tan lista como se desee (mucho más lista que un procesador) y
realizará tareas como la declaración de variables, la liberación de
memoria o la gestión del flujo de ejecución. El conjunto compilador y
máquina virtual se denomina intérprete y los lenguajes que soportan
este funcionamiento se llaman *lenguajes interpretados*.  Que el
código sea ejecutado por un programa y no por el propio ordenador es
mucho más lento, por este motivo las máquinas virtuales no se
popularizaron hasta finales de los noventa.  El paso siguiente es
hacer desaparecer incluso este ensamblador intermedio y con él el
compilador.  Ya no existe un compilador y una máquina virtual sino que
sólo un programa, el intérprete, realiza todo el trabajo.  Este último
planteamiento no es necesariamente superior en eficacia o rendimiento
a una máquina virtual, simplemente es más fácil de diseñar e
implementar.  Matlab pertenece a este último grupo.

Lenguajes estáticos y dinámicos
...............................

Un requisito imprescindible cuando no se utiliza un intérprete es que
cada una de las variables del programa debe tener un tipo asignado, su
expresión en la memoria del ordenador.  Si la variable *i* debe
contener un número entero el compilador debe saberlo antes de traducir
el código.  Es por este motivo que en lenguajes como Fortran o C es
necesario *declarar* las variables antes de utilizarlas por primera
vez.

Como hemos mencionado en el apartado anterior, un intérprete es mucho
más listo.  Esto puede aprovecharse para que no sea imprescindible
utilizar la declaración y que el intérprete vaya siguiendo el tipo de
cada variable desde la asignación inicial durante toda la ejecución
del programa. Esa variable *i* que en un principio es un entero puede
convertirse en cualquier momento en un número en coma flotante,
en este caso el intérprete se encargará que la variable *i* cambie de
tipo adecuadamente en tiempo de ejecución.

Los lenguajes para los que la declaración es imprescindible se
denominan *estáticos* y los que no la necesitan se llaman *dinámicos*.
La mayoría de lenguajes interpretados son dinámicos.  

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
herrameinta para todo.  Un buen editor nos ayudará a sangrar bloques,
coloreará las palabras clave, nos avisará si cometemos algún error
evidente...

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

Qtoctave
........

Qtoctave es un IDE para el uso del intérprete Octave.  Su nombre viene
dado por la librería gráfica que usa, Qt, de Nokia.  Desarrollado Luis
Lucas Rosado, es también un proyecto de software libre que va ganando
madurez con el tiempo.


