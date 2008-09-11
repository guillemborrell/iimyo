Introducción
============

Lenguajes interpretados o de scripting
--------------------------------------

Un script o guión es una serie de órdenes que se pasan a un
intérprete para que las ejecute. No cumplen la
definición de programa porque no son ejecutables por ellos mismos. Un
programa se comunica directamente con el sistema operativo mientras
que un script lo hace con un intérprete que a su vez envía comandos al
sistema operativo. En este proceso de comunicación *el programa
no es el script, el archivo de código, sino el intérprete* que lee
línea por línea el código y que no ejecuta la siguiente orden hasta
que no ha terminado con la anterior.

Esta es la diferencia entre los lenguajes basados en código fuente de
los lenguajes de scripting. Los primeros son C, C++, Fortran, Ada,
Cobol, Pascal... El código fuente escrito es transformado por un
compilador en un archivo ejecutable binario que sólo
es capaz de entender el ordenador.

Los lenguajes de scripting más conocidos son, en el caso de los
lenguajes de uso general, Java, Python y Ruby. La popularidad de Java
se debe a su naturaleza de producto comercial muy sencillo de
administrar mientras que Python y Ruby son Software Libre; de igual o
más calidad pero sin publicidad.  Python es un lenguaje basado en la
consistencia que ofrece una gran productividad y versatilidad.  Ruby
es uno de los lenguajes más recientes, su popularidad está aumentando
gracias a la aplicación Ruby on Rails orientada al desarrollo de
páginas web.

Existe una gran variedad en los lenguajes de scripting orientado a
matemáticas. Matlab, Maple, Mathematica, Scilab, Octave, Euler,
O-Matrix, R o S son lenguajes de scripting.  Los más conocidos son
Matlab, Mathematica y Maple.

No debemos considerar Matlab como únicamente un producto. El scripting
científico es una gran herramienta que hay que dominar
independientemente del programa. Una vez hayamos aprendido a usar
Matlab es posible que se tengamos que aprender a utilizar R, orientado
a análisis de datos, o Scilab si trabajamos en Francia.

Un lenguaje intepretado para Cálculo Numérico: Matlab
-----------------------------------------------------

Un lenguaje interpretado se parece a una herramienta que todos
conocemos perfectamente, una calculadora. Es incomprensible como
alguien se siente completamente cómodo delante de una cajita con una
pantalla y muchas teclas le invada el miedo delante de una consola en
la que sólo aparece un simbolito::

  >>

¿Qué hacemos a parte de quedarnos paralizados? Pues si esto es una
calculadora vamos a usarlo como una calculadora::

  >> 2+2
  ans = 4  

Este ejemplo no sirve para nada pero resume perfectamente el uso de
Matlab. En el fondo es una calculadora programable con unas
posibilidades casi infinitas. Si a esto se suma un lenguaje intuitivo
y una gran biblioteca de funciones el resultado es una herramienta
verdaderamente útil para ingenieros y científicos.

Esta manera de trabajar no es un invento de Matlab, los lenguajes
interpretados ya existían mucho antes. Lo que sí es novedoso es basar
la arquitectura del lenguaje en conceptos matemáticos; entre ellos uno
muy importante: la función. Mientras los lenguajes clásicos se basan
en subrutinas o objetos Matlab dispone de una biblioteca formada
exclusivamente por funciones. Este diseño tan simple es lo que ha
llevado Matlab a su éxito, es un acercamiento matemático a la
programación orientada a matemáticas. Si queremos calcular el seno de
:math:`\frac{\pi}{2}` lo que haremos será llamar a la función como se haría
sobre el papel::

  >> sin(pi/2)
  ans = 1

Entonces nada impide usar el mismo concepto para resolver problemas
mucho más complejos::

  >> quad(@(x) besselj(2.5,x),0,4.5)
  ans = 1.1178

Acabamos de hacer la siguiente integral de la función real de Bessel
de primera especie:


.. math::

  \int_{0}^{4.5}J_{2.5}(x)\ dx

:term:`quad` y :term:`besselj` son funciones que se han compuesto del
mismo modo que se compondrían funciones matemáticas.  Esta línea de
código puede ser incomprensible pero al final la entenderemos con
todos los detalles.
