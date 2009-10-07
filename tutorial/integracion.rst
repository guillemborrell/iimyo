Integración y Ecuaciones Diferenciales Ordinarias
=================================================

Este capítulo trata sobre dos disciplinas bastante extensas dentro del
Cálculo Numérico.  El motivo es que existen muchos métodos para
integrar una función o una ecuación diferencial y algunos funcionarán
mejores que otros según el caso.  Nos centraremos en las integrales
definidas

.. math::

   I = \int_{x_i}^{x_f} f(x) dx

y en los problemas de Cauchy; ecuaciones diferenciales ordinarias en
los que conocemos la ecuación diferencial y las condiciones iniciales
del sistema

.. math::

   \frac{d \vec x}{dt} = f(\vec x,t)\qquad \vec x(0) = \vec x_0

El resultado del primer problema es bien un número o una función que
depende de los límites de integración.  El resultado del segundo
problema es una trayectoria en el espacio :math:`\vec x(t)`.

Integración Numérica
--------------------

La complejidad de la integración depende de las dimensiones de nuestro
problema. Si queremos integrar una función con sólo una variable
:math:`f(x)` entonces necesitaremos la función (definida como función
anónima) y dos escalares que harán de límites de integración.  Si la
función depende de dos variables :math:`f(x,y)` la cosa se complica
porque el límite de integración es una curva en el plano.  Para esta
introducción nos frenaremos en el caso más fácil.

.. function:: quad(fun,a,b)

   Calcula la integral definida de una función entre los intervalos de
   integración *a* y *b*.  *fun* debe ser una función anónima.

Por ejemplo, supongamos que queremos saber el valor de la superficie
encerrada debajo de la campana de Gauss normalizada

Integración de problemas de Cauchy
----------------------------------

Debemos distinguir dos tipos de ecuaciones diferenciales, las lineales
y las no lineales.
