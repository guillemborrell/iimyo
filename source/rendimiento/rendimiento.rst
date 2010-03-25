Aumentar el rendimiento de Matlab
=================================

El objetivo principal de Matlab es resolver rápidamente problemas de
Cálculo Numérico. Ser capaces de implementar el algoritmo en menos
tiempo tiene un coste, la velocidad de ejecución suele ser menor que
la que obtendríamos utilizando C, C++ o Fortran.  Sin embargo hay
cierta confusión cuando se habla de rendimiento y Matlab.

Matlab es un lenguaje dinámico, esto es, las variables no se declaran
y nunca existen de forma estática en una posición de memoria
conocida.  En los lenguajes dinámicos es el intérprete el que decide
dónde estarán realmente los datos y nunca tendremos un acceso directo
a ellos a no ser que consigamos engañarlo.

Lo que realmente hace que la velocidad de ejecución de los lenguajes
estáticos sea mayor es que el programa sabe en cada momento dónde
están los datos en la memoria.  En este caso podrá hacer sus cuentas
sin tener que preguntarse constantemente a qué posición de memoria
tiene que acceder.  En un lenguaje dinámico el intérprete lleva en
tiempo de ejecución la gestión de la memoria y las posibilidades para
optimizar el cálculo son más limitadas.

.. important::

  En los lenguajes estáticos la optimización depende en gran medida de
  lo buenos que seamos programando y del conocimiento que tengamos
  sobre el hardware.  En los lenguajes dinámicos el factor más
  decisivo es la capacidad del intérprete en hacer lo mismo.


Llegados a este punto es importante mencionar que los lenguajes
interpretados pueden ser estáticos.  Java es un lenguaje interpretado
que soporta la declaración de variables estáticas.  El intérprete
compila el código y lo optimiza antes de proporcionarlo a la máquina
virtual.  Si todas nuestras estructuras son estáticas y la máquina
virtual funciona correctamente la velocidad de ejecución debería
parecerse a la del mismo algoritmo implementado en Fortran o en C.

Teniendo en cuenta lo anterior. ¿Cúan listos son los lenguajes
dinámicos optimizando?  Sin duda cada vez más.  No todo el código de
un programa es puramente dinámico, hay partes estáticas o que pueden
serlo en algún momento.  La manera de conseguir que los lenguajes
dinámicos sean más rápidos es tomar ciertas porciones de código,
reescribirlas como estáticas y aplicar optimizaciones.  Este proceso
sucede en tiempo de ejecución y se llama optimización Just in Time.
La pieza del intérprete que se encarga de esta traducción se llama
compilador Just in time (JIT).

.. note::

  Un compilador JIT funciona traduciendo porciones de código a
  ensamblador.  Pero cada arquitectura tiene sus propios comandos, el
  código para x86 (Intel y AMD) no funcionará en un procesador POWER
  ni en un SPARC.

Estos compiladores son brillantes piezas de ingeniería y pueden
aumentar la velocidad de ejecución hasta en dos ordenes de
magnitud. Hace una década pocos intérpretes o máquinas virtuales
contaban con un compilador JIT y éste sólo optimizaba unas pocas
estructuras como los bucles con contador.  Actualmente se consideran
como una parte esencial de la implementación de un lenguaje dinámico.

.. warning::

  Matlab dispone de un compilador JIT para x86. Dentro de las
  alternativas libres FreeMat también dispone de uno mientras que
  sigue siendo una asignatura pendiente para Octave.

Nuestro objetivo es que el intérprete haga el trabajo estrictamente
necesario porque mientras hace otras cosas no se dedica a operar con
nuestros datos.  Ya hemos visto que gracias a la compilación JIT el
inérprete es capaz de ahorrarse trabajo futuro.  También nosotros
podemos ayudarle utilizando un determinado estilo de programación.  La
manera más sencilla es utilizar las operaciones más rápidas, la más
complicada es *extender el intérprete*.

Matlab y Octave están programados en C y C++ respectivamente.  No son
en esencia distintos de cualquier otro programa en C que dependa de
librerías para Cálculo Numérico como BLAS o Lapack.  El intérprete
puede extenderse escribiendo una librería y enlazándola al mismo
cuando sea necesaria.  Al estar programada en un lenguaje estático y
vivir fuera del inérprete podremos utilizar las estrategias de
optimización que creamos necesarias porque el intérprete es incapaz de
ver las variables internas de la librería.

En esta sección pondremos ejemplos sobre cómo sacar el máximo partido
a Matlab, cómo no poner trabas al compilador JIT y cómo escribir
extensiones para cada uno de los intérpretes.
