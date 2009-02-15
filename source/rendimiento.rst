Aumentar el rendimiento de Matlab
=================================

En Matlab, al igual que todos los lenguajes dinámicos, cualquier
código necesitará entre una y mil veces más tiempo para ejecutarse
respecto a la misma implementación en Fortran o C.  El motivo es que
ciertas operaciones son, por su propia naturaleza, más lentas si no se
conocen los tipos de datos de antemano. El uso abusivo de asignaciones
o llamadas a funciones puede provocar un desastre.

.. warning::

  Matlab no es la herramienta adecuada para realizar cálculo numérico
  de fuerza bruta.  Es un lenguaje de prototipado muy versátil que
  nunca fue diseñado para el *number crunching*.

Muchos de los problemas de rendimiento derivados de la propia
arquitectura de Matlab pueden evitarse teniendo en cuenta sólo un par
de factores:

* Las operaciones vectoriales son mucho más rápidas que las puramente
  escalares. Evitar los bucles como la peste caracteriza la
  programación a la Matlab.  Esta afirmación no es siempre cierta
  desde la introducción de un compilador JIT pero nunca está de más
  tenerla en cuenta.

* Muchas de las funciones disponibles en la biblioteca y los toolkits
  están escritas en C, esto significa que su velocidad de ejecución
  será mucho mayor que cualquier implementación que podamos hacer en
  Matlab. Otra característica de la programación a la Matlab es el uso
  masivo de funciones aunque realicen tareas triviales.

Todas las estrategias de optimización tienen un precio, algunas en
horas de trabajo, otras en precisión de cálculo. Si optimizar o no o
qué estrategia seguir son siempre decisiones que requieren
experiencia.

Antes incluso de seguir leyendo este capítulo uno debe plantearse
seriamente si necesita optimizar su código.  Para intentar
sistematizar esta toma de decisión estas son las dos preguntas clave:

#. ¿Se exactamente en qué parte necesito más velocidad?

#. ¿Voy a tardar más en mejorarlo que el tiempo de más que estaría
   ejecutándose?

La primera pregunta tiene que ver con la manera correcta de
programar.  Empezar un proyecto pensando en la velocidad de ejecución
es un error reconocido por quienes lo han intentado alguna vez.  Los
programas deben funcionar, luego funcionar correctamente y finalmente,
sólo si es necesario y sobran recursos, ser eficientes.  Cuando uno
implementa un algoritmo siempre habrá una o dos operaciones
responsables de la mayor parte del tiempo de cálculo: una
interpolación, resolver un sistema de ecuaciones, un proceso
iterativo... Una vez identificada la operación más exigente debemos
escoger una estrategia de optimización; es entonces cuando debemos
hacernos la segunda pregunta.

Para elegir una estrategia lo haremos por coste de implementación.  Si
el tiempo y el esfuerzo son pocos la calificaremos como barata, en
caso contrario será cara. Eliminar un bucle y utilizar bloques para
calcular es una estrategia barata, no implica modificar el algoritmo y
es una operación sencilla dentro de Matlab. Reescribir una función en
C o C++ es una estrategia cara.

En este capítulo trataremos los métodos más universales para hacer que
los tiempos de ejecución se reduzcan entre uno y dos ordenes de
magnitud.

Eliminar bucles innecesarios
----------------------------

El bucle es de por sí una operación lenta en un lenguaje
dinámico.  De un modo muy profano se podría asegurar que en este tipo
de lenguajes la asignación, es decir, el operador ``=``, realiza en
realidad muchas más operaciones que la de copiar un dato.

.. note::

  Matlab cuenta con un compilador JIT para arquitecturas x86.  Un JIT
  es un compilador intermedio que reconoce unas pocas estructuras de
  código y las compila a lenguaje ensamblador para la arquitectura
  objetivo.  Todo esto se hace en tiempo de ejecución cuando el código
  se preprocesa.  Este tipo de operaciones consiguen velocidades
  equivalentes a las que se obtendrían con C sin optimizar.

  No existen compiladores JIT perfectos.  Si bien cuando funcionan
  correctamente son de gran ayuda no es una buena idea condicionar un
  algoritmo a su existencia.  Uno de los motivos con más peso es que
  los JIT no son portables.

Con la eliminación de bucles sucede algo parecido con las estructuras
``goto``. Puede darse el caso que un problema se resuelva de manera
mucho más elegante con un ``goto`` pero esto no significa que su uso
indiscriminado sea una buena idea [#]_. En muchos casos el propio
algoritmo pide a gritos un bucle y buscar una alternativa más
eficiente es sólo cuestión de pericia.

.. [#] Una de las primeras discusiones sobre teoría de lenguajes de
   programación fue si la cláusula ``goto`` era realmente necesaria
   para implementar algoritmos. Edsger Dijkstra, uno de los pioneros
   en dotar a la programación de formalidad argumentó por primera vez
   en su artículo *Goto clause considered harmful* (cita) que cualquier
   programa podía escribirse sin ninguna necesidad de conectar el
   flujo de ejecución con las líneas. Dijkstra convenció al mundo de
   la informática que los problemas derivados de la sentencia ``goto``
   eran mucho mayores que los posibles beneficios.


¿Cuán lento es un bucle?
........................

Gráficas.

Estrategias a seguir
....................

uso de reshape y find.

Aproximar en vez de evaluar
---------------------------

Nunca hay que perder de vista que en el Cálculo Numérico el resultado
exacto no existe.  Además en Ingeniería pocos modelos consiguen más de
dos cifras significativas correctas. Aproximar una función cuando se
puede calcular su resultado sólo evaluando una expresión parece un
crimen pero en muchos casos es sólo un mal menor.

Supongamos que estamos intentando resolver 
