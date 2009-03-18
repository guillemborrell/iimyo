Difusión bidimensional
======================

La difusión molecular es un proceso propio de las mezclas de gases en
los que en algún momento el componente minoritario se encuentra a una
densidad distinta que el mayoritario.  Es lo que sucede cuando, por
ejemplo, se suelta algún contaminante en el ambiente.  El componente
minoritario se difunde hasta que se mezcla completamente con el
mayoritario y no existen ya gradientes de presiones parciales.

El comportamiento del componente minoritario se describe mediante la
ley de Fick de ecuación

.. math::

   \rho_c \vec v_d = - \rho \gamma \nabla Y_c

donde :math:`\gamma` es el coeficiente de difusión y depende de las
características de la mezcla.

Esta ecuación no distingue entre direcciones privilegiadas para las
que la difusión sea menor o mayor. La difusión es un fenómeno que
ocurre en todo el volúmen y es invariante para giros y traslaciones.
Esta es precisamente la condición que vamos a modificar para este
ejercicio, supondremos que la difusión es distinta según la dirección
en la que ocurra.  De este modo ya no existe un coeficiente de
difusión sinó que el fenómeno será descrito por un tensor; el tensor
de difusión.

.. math::

   \rho_c \vec v_d = - \rho K_{ij} \nabla Y_c

Esta expresión se impone en la ecuación de continuidad para la especie
minoritaria llegando a la siguiente ecuación.

.. math::

   \partial_t Y_c = (\nabla \cdot K ) \nabla Y_c + (\nabla \cdot K
   \cdot \nabla ) Y_c

En la que :math:`\nabla = (\partial_x, \partial_y, \partial_z)` es el
operador vectorial típico de la geometría diferencial.

La única simplificación que haremos al modelo es suponer que el tensor
es constante en todo el espacio, es decir, no hay variaciones
espaciales de ninguna de sus componentes.  La ecuación se reduce
entonces a

.. math::

   \partial_t Y_c = (\nabla \cdot K \cdot \nabla ) Y_c

A partir de ahora nos centraremos en el problema en dos dimensiones
así que reescribiremos la ecuación en forma escalar

.. math::

   \partial_t Y_c = K_{xx} \partial_{xx} Y_c + K_{yy} \partial_{yy}
   Y_c+ (K_{xy}+K_{yx})\partial_{xy} Y_c

El objetivo de este ejercicio es analizar la evolución temporal de una
distribución gaussiana de gas minoritario de ecuación

.. math::

   Y_{c0} = A e^{-\mu x^2 - \nu y^2}


con las siguientes constantes:

* :math:`\mu = \nu = A = 1`

* :math:`K_{xx} = K_{xy} = 1` y :math:`K_{xy} = K_{yx} = 0.5`

y demostrar que existen dos direcciones principales de difusión que
coinciden con los autovectores de la matriz :math:`K` definida como

.. math::
   :label: ortogonal
   
   (\nabla \cdot K \cdot \nabla ) Y_c =
   \left( \begin{array}{cc}
   \partial_x & \partial_y
   \end{array}
   \right)
   \left( \begin{array}{cc}
   K_{xx} & K_{xy} \\
   K_{yx} & K_{yy}
   \end{array}
   \right)
   \left(\begin{array}{c}
   \partial_x\\ \partial_y
   \end{array}
   \right) Y_c


Solución
--------

.. note::

   Puede encontrarse una descripción más completa de los esquemas de
   diferencias finitas en [HER]_

Resolveremos el problema mediante diferencias finitas centradas de
segundo orden.  El primer paso es convertir la ecuación diferencial en
una ecuación en diferencias utilizando la discretización espacial
propuesta

.. math::

   (\partial_{xx} u)_{ij} = \frac{1}{\Delta
   x^2}(u_{i+1j}-2u_{ij}+u_{i-1j}) + \mathcal{O} \Delta x^2

.. math::

   (\partial_{yy} u)_{ij} = \frac{1}{\Delta
   x^2}(u_{ij+1}-2u_{ij}+u_{ij-1}) + \mathcal{O} \Delta y^2

.. math::

   (\partial_{xy} u)_{ij} = \frac{1}{4 \Delta x \Delta y} (
   u_{i+1j+1}+u_{i-1j-1}+u_{i+1j-1}+u_{i-1j+1}) + \mathcal{O} (\Delta
   x^2+\Delta y^2)
   
La ecuación en diferencias final será

.. math::

   \begin{array}{rl}
   \partial_t u =& \frac{K_{xx}}{\Delta x^2}(u_{i+1j}+u_{i-1j})+\\
   &+\frac{K_{yy}}{\Delta y^2}(u_{ij+1}+u_{ij-1})-\\
   &-2 \left( \frac{K_{xx}}{\Delta x^2}+\frac{K_{yy}}{\Delta y^2}
   \right) u_{ij}+\\
   &+\left(\frac{2K_{xy}}{4 \Delta x \Delta y}\right)
   (u_{i+1j+1}+u_{i-1j-1}+u_{i+1j-1}+u_{i-1j+1})
   \end{array}

Las condiciones de contorno son algo complicadas debido a que es
difícil simular el hecho que la frontera es en realidad el infinito.
Como sólo nos interesa el comportamiento no estacionario en tiempos
cortos utilizaremos condiciones de contorno periódicas.  La única
precaución a tener en cuenta es que la condición de contorno debe
influir poco en la solución.  Valorar esta influencia tiene cierta
complicación así que en este ejercicio simplemente no se considerará.



.. [HER] J.A. Hernández, E. Valero. Análisis y Cálculo Numérico en
   Ecuaciones en Derivadas Parciales.
