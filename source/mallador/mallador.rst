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
[-1,1] \subset \mathbb{R}` agrupando los puntos en los extremos y en
el centro
