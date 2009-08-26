Primer contacto
===============

Tras encender Matlab la sensación puede ser de saturación.  La
interfaz gráfica de Matlab no se corresponde a la sencillez de uso
real del programa.  Al final terminaremos usando un par de cosas e
ignorando el resto.  Por ahora nos interesan sólo dos herramientas: la
consola y el editor.

El editor nos servirá para escribir o modificar los programas y la
consola será nuestra vía principal de comunicación con Matlab.
Cualquiera de las operaciones de la interfaz gráfica pueden realizarse
únicamente escribiendo comandos en la consola.  De momento es en lo
único que debemos centrarnos, durante esta primera introducción
bastará cone escribir comandos detrás del símbolo ``>>``.

Fundamentos de programación
---------------------------

Nuestro punto de partida es así de simple:

.. code-block:: matlab

  >> a = 1;

Hay tres elementos en esta línea de código:

* ``a`` es una variable

* ``=`` es el operador asignación

* ``1`` es el literal que define el número 1.

Una variable es una palabra cualquiera.  La única restricción es que
no podemos utilizar unos pocos caracteres reservados como ``+``, ``-``
o ``*``.  Debemos escoger siempre nombres bien descriptivos que
permitan descifrar el algoritmo que se está implementando.  Las
velocidades pueden llamarse ``v`` y las coordenadas ``x`` e ``y``
respectivamente.

El operador asignación almacena en memoria el resutado de la operación
de su derecha y la asigna (por eso su nombre) a la variable.  En
Matlab cada comando sólo puede obtener un operador asignación y a su
izquierda sólo puede haber una variable.

.. note::

  Otros lenguajes de programación como C++ permiten la asignación en
  cualquier estructura de código.  Por ejemplo

  .. code-block:: c++

    #include <iostream>

    int main(int argc, char *argv[])
    {
      int c;
      if(c = 1 > 0){
        std::cout << "Mayor que cero" << std::endl;
      }
      std::cout << c << std::endl;
      return 0;
    }

  Tiene la siguiente salida por pantalla::

    Mayor que cero
    1

  Esta estructura es sencillamente imposible en Matlab.

Ahora tenemos un mecanismo para almacenar cualquier resultado
independientemente de su naturaleza en la memoria del ordenador.  Esta
es la esencia de la programación: calcular a partir de datos
almacenados en la memoria.  Ahora tenemos muchas preguntas por
contestar. ¿Qué estamos calculando realmente? ¿Cómo se almacenan los
resultados en la memoria? etc. Todas estas preguntas encontrarán
respuesta más tarde.

.. important::

  Matlab distingue entre letras mayúsculas y minúsculas en los nombres
  de las variables.

Para ayudarnos en las sesiones interactivas Matlab define una variable
especial llamada ``ans`` y que no debemos sobreescribir nunca.  Cada
vez que ejecutemos un comando y no asignemos su resultado a una
variable Matlab hará dicha asignación de manera completamente
automática a la variable ``ans``.

.. code-block:: matlab

  >> 2+2
  ans =
        4

Matlab es un lenguaje de programación
-------------------------------------

Matlab es un lenguaje de programación, un conjunto de reglas para
escribir programas de ordenador.  Matlab es un lenguaje de
programación orientado al Cálculo Numérico (de ahí su nombre Matrix
Laboratory) y es difícil encontrarle cualquier otra aplicación.  Desde
un punto de vista estético y práctico Matlab es un buen lenguaje de
programación para realizar programas breves y simples.  Matlab no es
adecuado para:

* Implementación de algoritmos complejos que requieran de modelos de
  datos complejos organizados de forma jerárquica.  Aunque con Matlab
  podemos programar utilizando la orientación a objetos no puede
  considerarse un buen lenguaje para ello.

* Computación de alto rendimiento. El HPC es un caso de uso extremo de
  los recursos de cálculo. Matlab tiene un rendimiento razonable en la
  mayoría de los casos pero un buen programador puede multiplicar
  entre diez y cien veces la velocidad de ejecución de un programa
  utilizando C o Fortran.

* Grandes proyectos de software.  Matlab no es una buena elección para
  un programa que crece más allá de unos cuantos miles de líneas.  No
  hay una razón única para ello pero se podría decir que la
  complejidad del código escala mal.

Pero lo realmente valioso de Matlab no son sus capacidades como
lenguaje sino las siguientes:

* Existe un uso generalizado de Matlab en Ingeniería, es una
  herramienta de gran popularidad y es útil para una carrera
  profesional. Esto lo ha convertido en un estándar de-facto para la
  escritura de pequeños programas de simulación.

* Matlab cuenta con una extensa biblioteca de funciones que cubren
  casi todas las disciplinas de la Ciencia y la Ingeniería
  extensamente documentada y de fácil uso.


Matlab es un lenguaje interpretado
----------------------------------

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

Matlab es un lenguaje dinámico
------------------------------

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


El intérprete Octave para el lenguaje de programación Matlab
------------------------------------------------------------

Cuando consideramos Matlab un lenguaje de programación la razón de ser
de Octave se hace obvia.  Muchos desarrolladores querían utilizar el
lenguaje Matlab pero o bien no podían permitirse el coste de una
licencia o no estaban dispuestos a utilizar software propietario.
Octave no es exactamente un intérprete para el lenguaje Matlab porque
es un objetivo móvil, cambia en cada versión y muchas de las
funcionalidades deben entenderse por ingeniería inversa.  Una
diferencia que sí se mantendrá durante mucho tiempo es que, mientras
Matlab es un entorno de desarrollo integrado, Octave es sólo un
intérprete y necesitaremos otras herramientas para hacerlo
verdaderamente funcional.

Octave cuenta con un grupo de desarrolladores entusuasta y una enorme
comunidad de usuarios.  Si tenéis algún problema utilizando Octave
recomiendo encarecidamente darse de alta en la lista de correo.
Podéis encontrar más información en http://www.octave.org.  Octave
funciona en prácticamente cualquier sistema operativo mayoritario como
Windows, Linux, MacOS X, Solaris...

.. note::

  Octave está ganando importancia dentro de entornos grid y en el
  *cloud computing*.  En un entorno grid todos los recursos están
  abstraídos de manera que el usuario no sabe en realidad dónde está
  ejecutando cada tarea; es el middleware el que decide cuál es el
  entorno de ejecución más adecuado.  Esto significa que debe haber
  una licencia de Matlab por cada tarea en grid que lo requiera, algo
  que puede estar fuera del alcance de la infraestructura por motivos
  de coste.  Octave representa una alternativa a Matlab en estos
  entornos.

Lenguajes de programación modernos
----------------------------------

Los ordenadores lo han cambiado todo.  Fuerno inventados para
ayudarnos en tareas repetitivas pero ahora forman parte de cada
aspecto de nuestra vida.  El primer ordenador que se instaló en España
fue un mainframe IBM para calcular declaraciones de hacienda.  Ahora
hay más teléfonos móviles que habitantes.  Pero un ordenador es algo
vacío sin software, y cada línea de código ha sido programado en un
lenguaje de programación.

Hay cientos de lenguajes de programación pero sólo unos pocos llegan a
ser populares.  Quizás habéis oído hablar alguna vez de C, C++ o
Java.  Pero hay muchos más: Python, Ruby, Perl, Erlang, Lua, C#,
Fortran, Haskell, Effiel, Smalltalk, Javascript, Ocaml, Ada... Todos
ellos tienen miles de usuarios.  Hablemos de alguno de ellos.

Google utiliza sólo cuatro lenguajes de programación: C++, Java,
Javascript y Python, quizás no conozcáis el último.  Python es quizás
el lenguaje de programación más consistente y simple.  Es directo,
fácil de aprender y con todas las posibilidades que se esperan de un
lenguaje de programación moderno: orientación a objetos, modularidad,
iteradores, una enorme librería estándar...  Se dice que Python es tan
simple que nunca debería ser el primer lenguaje de programación de
nadie: luego el resto parecen demasiado difíciles. Por último y no
menos importante: es software libre.

Fortran fue el primer lenguaje de programación y es aún una
herramienta común en Ciencia e Ingeniería. Desde su creación a finales
de los cincuenta ha visto como una media docena de revisiones, el
último estándar es Fortran 2008. Desde el gremio de la informática
muchos programadores tildan a Fortran de un lenguaje obsoleto.  Quien
lo diga probablemente no haya usado Fortran en su vida.

.. [KnR] El Lenguaje de Programación C. Brian W. Kernighan, Dennis M. Ritchie. Pearson Educación (2ª Ed. 1991)
