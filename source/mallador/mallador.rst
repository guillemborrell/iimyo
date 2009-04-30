Mallar es un placer
===================

El objetivo de este ejercicio en varias partes es demostrar cómo se
debería afrontar el desarrollo de un proyecto de tamaño medio en
Matlab.  Se trata de resolver una ecuación en derivadas parciales,
concretamente la ecuación de Poisson

.. math::
   :label: poisson

   \nabla^2 \phi = f

mediante el método de elementos finitos.  Como ya hemos mencionado
repetidas veces, los intérpretes de Matlab no son ni mucho menos
adecuados para la solución de problemas de gran tamaño pero sirve para
demostrar que la metodología propuesta es útil independientemente de
la cantidad de código que sea necesario escribir.

Este capítulo trata de la primera parte siempre que se quiere utilizar
el método de los elementos finitos, la discretización del dominio.
Quizás el punto más fuerte de los elementos finitos es que su
aplicación no se hace complicada en la misma medida que la geometría
del problema.  Es por este motivo que, junto con los volúmenes
finitos, son de uso habitual en códigos comerciales para ingeniería.
Esto es debido a que, dada una discretización no estructurada del
dominio mediante triángulos, cuadriláteros o tetraedros, el
planteamiento de las ecuaciones no está íntimamente ligado a su
forma.

Para completar este ejemplo se necesita seguir un desarrollo teórico,
que aunque es bastante simple, es tan largo como aburrido. Es de
interés para quien quiera conocer detalles sobre el proceso de
generación de mallas para la discretización de dominios pero puede
omitirse sin ninguna penalización.

Planteamiento unidimensional
----------------------------

El sistema de segundo orden formado por una masa, un muelle y un
amortiguador viscoso se estudia en cualquier curso de Mecánica
Clásica.  Se describe mediante la ecuación diferencial lineal de
segundo orden

.. only:: latex

   .. figure:: oscilador.pdf
      :align: center
      :scale: 100

      Esquema del sistema masa con muelle y amortiguador

.. only:: html

   .. figure:: oscilador.png
      :align: center
      :scale: 100

      Esquema del sistema masa con muelle y amortiguador


.. math::

   m \ddot x + d \dot x + k x = 0

El paso a seguir será el mismo de siempre: buscar las magnitudes
características del sistema y adimensionalizar la ecuación


* :math:`[L] \propto l` es cualquier longitud característica que puede ser la
  longitud inicial del muelle

* :math:`[M] \propto m` es la masa que introduce la inercia en el sistema

* Existen dos tiempos característicos para el sistema, el primero es
  el debido al sistema masa-muelle y el segundo al amortiguador
  viscoso.  Para el desarrollo teórico tomaremos :math:`[T_1] \propto
  \sqrt{\frac{m}{k}}` al que también llamaremos a partir de ahora
  :math:`\tau_1`. A la segunda constante posible con dimensiones de
  tiempo :math:`[T_2]\propto \frac{m}{d}` la llamaremos :math:`\tau_2`
  y aparecerá también en el sistema ya adimensionalizado.

La ecuación tras introducir la variable :math:`\xi = \frac{x}{l}` es

.. math::

   \ddot \xi + \frac{d}{\sqrt{km}} \dot \xi + \xi = 0

Esto significa que el sistema físico depende, a parte de sus
condiciones iniciales,  de un único parámetro que es precisamente el
cociente entre los dos tiempos adimensionales

.. math:: 

   \mu = \frac{d}{\sqrt{km}} = \frac{\tau_1}{\tau_2}

.. math::

   \ddot \xi + \mu \dot \xi + \xi = 0

Aunque parezca absurdo decirlo ahora, la única solución estática
posible, es decir, con :math:`\ddot \xi = 0` y :math:`\dot \xi = 0`
es :math:`\xi = 0`

El paso siguiente es suponer que tenemos varios osciladores conectados
en serie entre sí donde la primera y la última masa se mantienen fijas.

.. only:: latex

   .. figure:: osciladores.pdf
      :align: center
      :scale: 100

      Osciladores conectados en serie

.. only:: html

   .. figure:: osciladores.png
      :align: center
      :scale: 100

      Osciladores conectados en serie

Cuando las constantes de los muelles son iguales se llega con un poco
de cálculo a la siguiente ecuación

.. math::
   :label: sistema

   \ddot \xi_i + 2 \mu \dot \xi_i + 2\xi_i -\xi_{i-1} + \xi_{i+1} = 0

suponiendo que velocidad y aceleración son cero para encontrar la
solución de equilibrio estático

.. math::
   :label: estatica

   2\xi_i -\xi_{i-1} + \xi_{i+1} = 0

   
La solución de este problema se puede encontrar sin realizar ningún
cálculo.  La disposición de mínima energía para el sistema de
amortiguadores es que todos deben tener exactamente la misma
longitud.  El caso se vuelve interesante cuando no todas las
constantes :math:`k` son iguales.

En este caso, plantear un problema como el de la figura es bastante
complicado porque tanto el muelle como el amortiguador no están
asociados a una única masa sino que relacionan dos masas entre ellas.
Esto puede complicar sobre manera la construcción del sistema de
ecuaciones porque no toda la información se refiere a un punto.
Existe una estrategia para huír de este inconveniente, dividir cada
muelle en dos, asociando cada muelle a la masa a la que contacta, y
suponer que el amortiguamiento se debe a la existencia de un medio
viscoso.

.. only:: latex

   .. figure:: muellesserie.pdf
      :align: center
      :scale: 100

      Osciladores conectados en serie

.. only:: html

   .. figure:: muellesserie.png
      :align: center
      :scale: 100


El paso siguiente es hallar la equivalencia de un sistema de dos
muelles con un muelle único sabiendo que serán iguales cuando
almacenen la misma energía elástica.

.. math::

   \frac{1}{2} k_p (x+y)^2 = \frac{1}{2} k_1 x^2 + \frac{1}{2} k_2 y^2

Resolviendo la anterior ecuación para :math:`k_p` se llega a que la
expresión para la suma de muelles en serie es

.. math::

   k_p = \frac{k_1 k_2}{k_1+k_2}

Con esta nueva identidad la ecuación :eq:`sistema` queda reescrita
como

.. math::
   :label: problema

   \ddot \xi_i + \mu_i \dot \xi_i + \xi_i(k_{i+} + k_{i-}) - \xi_{i+1}k_{i+} -
   \xi_{i-1}k_{i-} = 0

donde respectivamente se definen

* :math:`k_{i+} = \frac{k_i k_{i+1}}{k_i + k_{i+1}}`

* :math:`k_{i-} = \frac{k_i k_{i-1}}{k_i + k_{i-1}}`

* :math:`\mu_i = \frac{d}{\sqrt{m_i k_i}}`

Finalmente, suponiendo que la velocidad y la aceleración son nulas
para una solución puramente estática se llega a la ecuación que, en
función de las constantes :math:`k_i` malla un dominio unidimensional.

.. math::
   :label: unidimensional

   \xi_i(k_{i+} + k_{i-}) - \xi_{i+1}k_{i+} - \xi_{i-1}k_{i-} = 0

.. note::

   Puede comprobarse fácilmente que cuando todas las constantes
   :math:`k_i` son iguales la ecuación :eq:`unidimensional` es igual a
   :eq:`estatica`

Supongamos que queremos mallar un dominio unidimensional :math:`x \in
[-1,1] \subset \mathbb{R}` para cualquier distribución dada de
constantes elásticas :math:`k(x_i)`.  El script para resolver este
problema es tan sencillo como el siguiente.

.. literalinclude:: mesh1d.m
   :language: matlab

Para usarlo basta con darle un vector de constantes para los muelles y
un intervalo.

.. code-block:: matlab

   >> k = polyval(polyfit([0,0.5,1],[10,1,10],2),0:0.1:1);
   >> % Creo el vector de constantes de rigidez, 10 elementos
   >> plot(0:0.1:1,k); %Pinto las constantes de rigidez
   >> hold on; % Fijo la figura
   >> p = mesh1d(k,[0,1]); % Creo la malla en el mismo intervalo
   >> plot(p,zeros(1,11),'k*'); % Pongo los nodos

El resultado es el siguiente

.. only:: latex

   .. figure:: nodos.pdf
      :align: center
      :scale: 100

      Constante de rigidez y posición de los nodos en el intervalo

.. only:: html

   .. figure:: nodos.png
      :align: center
      :scale: 100

      Constante de rigidez y posición de los nodos en el intervalo

Propongo el siguiente ejericio. ¿Cómo debería ser la curva de
constantes de rigidez para obtener los nodos de Chebyshev?

Planteamiento bidimensional
---------------------------

Alguien especialmente atento habrá advertido que el planteamiento del
problema depende únicamente de la posición de los puntos y de sus
relaciones, o en otras palabras, qué puntos están conectados con
muelles.  Este planteamiento no depende en ningún caso del número de
dimensiones del espacio.  Hemos empezado con una dimensión porque el
problema es mucho más sencillo por dos motivos:

* Establecer las relaciones entre puntos es trivial, cada nodo está
  relacionado con sus dos vecinos.

* Para cerrar el problema sólo se necesita la posición de dos puntos.

Mallar un dominio en el plano es mucho más difícil porque estas dos
condiciones cambian

* Cada punto está conectado a una cantidad a priori indeterminada de
  vecinos

* Para cerrar el problema se necesita un conjunto de puntos ordenados
  en un conjunto de dimensión menor.  En el caso del plano, una recta.

Ambos problemas tienen solución, pero tener en cuenta estas
consideraciones complicará bastante nuestro algoritmo.

Definición del contorno
.......................

La ecuación del problema n-dimensional sigue siendo
:eq:`unidimensional` en la que las variables :math:`\xi_i` han pasado
de ser escalares a vectoriales. La ecuación se puede formular entonces
para cada uno de sus componentes y para cada una de las relaciones
entre nodos

.. math::
   :label: ndimensional

   \vec \xi_i\sum_j k_j^\prime - \sum_j \vec \xi_j k_j^\prime = 0

.. math::
   :label: coeficiente

   k_j^\prime = \frac{k_i k_j}{k_i + k_j}

donde el índice :math:`j` cuenta todos los nodos conectados con el
nodo :math:`i`.

Como hemos dicho anteriormente, para resolver el problema es necesario
definir un contorno y establecer las conexiones entre nodos del
mallado.  Vamos a afrontar primero el problema del contorno.

Hemos visto que el problema se reduce a la resolución de un sistema de
ecuaciones lineales que depende de las coordenadas de los nodos.  El
contorno es imprescindible porque de otro modo la matriz sería
singular.  Desde un punto de vista puramente algebraico el sistema
tendría solución fijando únicamente dos puntos en el espacio, entonces
la solución nos situaría todos los nodos en la recta que une los dos
nodos fijos.

.. note::

   Otra vez, la intuición puede ayudarnos a deducir la forma de la
   solución.  El equilibro estático debe ser la solución con la mínima
   energía potencial.  Es trival demostrar que si sólo un nodo no se
   encuentra en la recta que une los dos puntos la energía del sistema
   es mayor.

Pero nos interesa mallar un dominio bidimensional y este dominio
estará como mínimo definido por un contorno y según se defina
llegaremos a dos problemas con dificultades muy distintas

* Conocemos exactamente la posición de todos los nodos que queremos
  situar en el contorno.

* No conocemos la posición de todos los nodos que queremos situar en
  el contorno.  Como mínimo uno puede deslizar como si fuera
  un abalorio.

Intuitivamente llegamos a la conclusión correcta que el primer caso es
el fácil y el segundo es el difícil. El motivo es que mientras en el
primer caso la ligadura es trivial de implementar, en el segundo
significará una ecuación adicional para nuestro sistema.

Definición de las conexiones
............................

El problema es cómo podemos conocer las conexiones definitivas entre
nodos si ni siquiera sabemos dónde van a estar.  Los nodos no existen,
sólo tenemos la ecuación para colocarlos y la frontera. Estamos ante
un problema de geometría computacional y tiene que ver con la
triangulación óptima de un conjunto convexo.

De un modo práctico no necesitamos la triangulación óptima sino una
triangulación que se acerque a la óptima de la solución.  De hecho
para arrancar el algoritmo nos vale con cualquier triangulación,
incluso una de puntos colocados aleatoriamente, eso sí, dentro del
contorno. Esto nos servirá para arrancar un proceso iterativo para
llegar al mallado óptimo del dominio encerrado por el contorno.

.. warning::

   Soy perfectamente consciente que considerar el resultado del
   proceso iterativo propuesto como óptimo no es ni mucho menos
   correcto, simplemente se refiere a que es el resultado de una
   iteración que busca un mínimo de un funcional.

Pero no vale cualquier distribución de puntos aleatoria, los puntos
deben estar dentro del dominio y ahí entra en juego la geometría
computacional.
