Diferencias entre Matlab y Octave
=================================

Aunque tras años de desarrollo el comportamiento de ambos intérpretes
se haya acercado existen en ciertos aspectos diferencias abismales
entre ellos.  Esto es debido a que su nacimiento fue completamente
independiente y, si bien un objetivo de Octave es el de buscar la
compatibilidad, nunca ha intentado copiar la arquitectura.  Es por
este motivo que muchas veces, como sucede en la propia documentación
de Octave, se meciona que se tratan de lenguajes de programación
distintos.

Existen tres tipos de diferencias entre Matlab y Octave

#. Diferencias heredadas de las primeras versiones de Octave.  En
   muchos casos se trata de funcionalidades de Octave que no tienen
   equivalente en Matlab.  Pueden perfectamente considerarse
   extensiones al lenguaje Matlab.  Están perfectamente documentadas
   en un apéndice del manual.

#. Funcionalidades de las últimas versiones de Matlab que no han sido
   aún implementadas en Octave.  Siempre existen diferencias debido a
   que los desarrolladores de Octave están apuntando un blanco en
   movimiento.

#. Diferencias debidas a la arquitectura de los intérpretes.  Sólo
   deberemos tenerlas en cuenta cuando escribamos extensiones al
   intérprete mediante otros lenguajes de programación.  Mientras
   Matlab está programado en C, Octave lo está en C++ y hace un uso
   extensivo de la STL.  Es mucho más sencillo programar extensiones
   para Octave puesto que pone a disposición del programador una
   extensiva librería en C++ que bien podría utilizarse de forma
   completamente independiente.  De todos modos existe en Octave una
   capa de compatibilidad para las extensiones de Matlab.
