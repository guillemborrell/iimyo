Diseño de aplicaciones en Matlab
================================

En ninguno de los muchos libros, cursos, introducciones o tutoriales a
Matlab se trata un tema tan esencial como la manera correcta de
estructurar un programa en Matlab.

Matlab no es, por desgracia, un lenguaje pensado para grandes
aplicaciones sino para pequeños prototipos sin demasiada importancia.
En las últimas versiones, gracias a la mejora de su orientación a
objetos, ha ganado algo de entidad al respecto pero aún dista de poder
ser considerado un lenguaje de propósito general. Matlab se ha
acercado a C++ y Java pero va muy a la zaga de los lenguajes dinámicos
más modernos como Python o Ruby.

Se pueden diseñar correctamente aplicaciones de cierto tamaño
independientemente del paradigma utilizado.  El sistema bancario
mundial se programó en COBOL antes que los objetos o los módulos
hicieran acto de presencia por primera vez.  Esta sección propone una
manera sistemática de reducir cualquier problema a estructuras propias
de Matlab intentando que ninguna parte del resultado parezca ajena al
lenguaje.

No es más que la enésima propuesta de cómo se debe programar en Matlab
así que nada la mantiene a salvo de posibles detractores.  Puede ser
mejor o peor que otros métodos pero nunca hay que olvidar que un mal
método siempre es mejor que ninguno.

Los dos axiomas
---------------

Los paradigmas de programación son una manera sistemática de reducir
la implementación de cualquier algoritmo. Existe la programación
procedimental, la modular, la orientación a objetos... Pero un
paradigma es lo suficientemente extenso como para permitirnos
implementar un algoritmo de muchas maneras distintas.  Este capítulo
no trata sobre paradigmas, hemos escogido de antemano un acercamiento
modular; propone una manera sencilla y sistemática de reducir la
mayoría de problemas a un conjunto conectado de bloques.

La programación es un ejercicio creativo y como tal es mucho más fácil
valorar si el resultado está bien o mal que proponer de antemano la
mejor manera de resolver el problema.  Es entonces un problema más
fácil de verificar que de resolver.

Es también un proceso de diseño en el que de una serie de piezas, en
este caso un lenguaje, creamos la solución a un problema.  El
resultado del proceso es código.

El diseño axiomático es la disciplina que pretende trasladar lo que se
aprende de valorar el resultado para que, antes de empezar a trabajar,
nos acerquemos más fácilmente a una solución más óptima de las
infinitas posibles.  Toda la experiencia en el análisis de los
procesos de diseño se ha reducido a dos axiomas:

* Máxima independencia.

* Mínima información.

Entonces la mejor manera de implementar un algoritmo será maximizando
la independencia de las unidades de programa y minimizando la
información necesaria para que funcionen.

*Máxima independencia* significa que cada una de sus piezas estará
mejor diseñada en la medida que su funcionamiento sea independiente de
las demás.  En palabras de Albert Einstein "hay que simplificar las
cosas pero no ser simplista" .Introducir dependencias entre elementos,
aunque pueda reducir su número, suele producir sistemas menos
robustos.

En el código de un programa, si declaramos una variable global en el
programa principal y la utilizamos en todas las unidades de programa
nuestro código será monolítico por mucho que nos parezca estructurado
porque esta variable global lo liga absolutamente todo.  Por este
mismo motivo se demonizó durante los años setenta la cláusula GOTO
puesto que ligaba el algoritmo a la manera en la que se había escrito.

La información de un sistema es la cantidad de datos necesarios para
construirlo y asegurar su funcionamiento. En un mecanismo la cantidad
de información se correspondría a todos los datos mostrados en el
plano: medidas, tolerancias, relaciones... La información es lo que
valora la simplicidad del producto.

Este axioma es un poco más complejo en nuestro caso porque es difícil
definir la cantidad de información que contiene un código.  Mi visión
personal es que el propio código es información así que en la medida
que nuestro código sea más extenso necesitaremos más información para
entenderlo y hacerlo funcionar.

Quen tenga un poco de experiencia programando sabrá que estos dos
axiomas entran en conflicto.  Los códigos puramente monolíticos suelen
ser más cortos que los modulares. Romper un algoritmo en rutinas y
funciones para maximizar la independencia requiere tiempo y esfuerzo y
hace que el programa crezca, aumentando por lo tanto la información
que contiene.  Una buena metodología de programación encontrará el
compromiso entre estos dos axiomas.

Este capítulo propone una metodología para el diseño de aplicaciones
con Matlab utilizando la programación modular.  Para intentar cumplir
los dos axiomas buscará:

* Definir unidades de programa independientes a partir de los datos.

* Sistematizar el desarrollo para que sea aplicable en cualquier caso.

Parámetros y variables.
-----------------------

La pieza fundamental de cualquier algoritmo en matemáticas son las
funciones.  Estas funciones dependen de parámetros, que no cambian en
el algoritmo, y variables.  Por ejemplo, si queremos saber cómo cambia
la presión de un gas en función de la temperatura a bajas presiones
utilizaremos la ecuación de estado para los gases perfectos

.. math::

   p(\rho,T) = R_g \rho T

Las variables de esta ecuación son la densidad y la temperatura
mientras que la constante de los gases ideales :math:`R_g` depende del
gas para el que calculemos la relación. Será por lo tanto un parámetro.

La diferencia esencial entre variables y parámetros es que nuestra
solución depende de los parámetros mientras que las variables son
*parte de la solución*.  En este caso la ecuación de estado *debe
depender de la densidad y la temperatura*.  Si nuestro resultado no
depende de ninguna variable será una constante pero desgraciadamente
no será así.

Esto nos permite crear dos reglas sencillas para descomponer cualquier
algoritmo en unidades de programa abstractas llamadas bloques:

* Un bloque depende de parámetros y de funciones.

* Los argumentos de salida de los bloques son funciones. 

Para entender el uso de estas dos reglas las aplicaremos a varios
casos de dificultad creciente.  Para empezar tomaremos la ecuación del
oscilador de Van der Pol.

Supongamos que nos piden la solución de esta ecuación diferencial no
lineal de segundo orden.

.. math::

   x'' +x + \mu(x^2-1)x' = 0

Para ello nos sugieren representar gráficamente la solución para un
conjunto de diez valores de :math:`\mu`. Se nos pide resolver el
problema de la integración de una EDO diez veces con un parámetro,
algo que para un principiante puede representar un serio problema.

El primer paso es diferenciar los parámetros de las variables.  En
este caso :math:`\mu` es el único parámetro mientras que :math:`x` y
el tiempo :math:`t` son las variables.

El bloque creará una función que dependerá de *x* y *t* a partir del
parámetro :math:`\mu`.  Para ello utilizaremos el handle ``@`` de
Matlab para hacer que el argumento de salida sea una función.

.. literalinclude:: modvdp.m
   :language: matlab

.. tip::

   Cuando un módulo sólo proporciona una función puede reducirse a una
   única función anónima.  Por ejemplo en el caso del módulo anterior

   .. code-block:: matlab

      >> modvdp = @(mu) @(t,x) [x(2); mu*(1-x(1).^2)*x(2)-x(1)];

Ahora podemos utilizar el argumento de salida del módulo ``modvdp``
como argumento de entrada de la función de integración ya sea
``lsode`` en Octave o ``ode45`` en Matlab.

Si analizamos esta manera de implementar la física del problema
con los dos axiomas vemos que el bloque es completamente independiente
del resto de funciones y que lo único que necesita para funcionar es
el parámetro :math:`\mu`.

A continuación aplicaremos estas dos reglas a ejemplos de dificultad
creciente.


.. toctree::
   :maxdepth: 1

   isa.rst
   saque.rst


