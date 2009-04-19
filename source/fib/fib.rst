La sucesión de Fibonacci
========================

La sucesión de Fibonacci se genera fácilmente mediante la siguiente
definición:

.. math

   F_n = \left\{ \begin{array}{cc}
   1 & n=1\\
   1 & n=2\\
   F_{n-1}+F_{n-2} & n>1\end{array}\right.

A parte de sus curiosas propiedades numéricas relacionadas con el
número áureo :math:`\varphi`, es un buen campo de pruebas para
comparar el rendimiento de Matlab y Octave con los bucles y los
condicionales.


Solución
--------

La que es quizás la implementación más obvia de la sucesión de
Fibonacci es la que llamaremos a partir de ahora ``fib_cache``::


