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

* Todas las estrategias de optimización tienen un precio, algunas en
  horas de trabajo, otras en precisión de cálculo. Si optimizar o no o
  qué estrategia seguir son siempre decisiones que requieren
  experiencia.

Antes incluso de seguir leyendo este capítulo uno debe plantearse
seriamente si necesita optimizar su código.  Para intentar
sistematizar esta toma de decisión estas son las dos preguntas clave:

#. ¿Se exactamente en qué parte necesito más velocidad?

#. ¿Voy a tardar más en mejorarlo que el tiempo de más que estaría
   ejecutándose?

