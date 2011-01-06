Programación en Matlab
======================

Antes de entrar en la práctica de la programación es importante dar
una pequeña nota sobre paradigmas de programación.  Un paradigma es
una metodología que viene impuesta por el propio lenguaje de
programación.  Los hay a decenas: programación imperativa,
estructurada, modular, orientada a objetos, diseño por contrato...

Aunque Matlab soporta la programación modular y la orientada a objetos
casi toda su librería está formada por funciones, no por módulos ni
clases ni cualqueir otra cosa.  Esto significa que, mientras el código
que escribamos nosotros puede seguir prácticamente cualquier
paradigma, si hacemos un uso extensivo de las funciones propias de
Matlab nos veremos forzados utilizar la programación estructurada.

Funciones
---------

Las funciones que hemos visto hasta ahora no eran funciones de verdad
sino funciones anónimas. Aunque en muchos casos son más prácticas que
las funciones es el momento de aprender a encapsular tareas
apropiadamente.

Abriremos el editor y escribiremos en él el siguiente código:

.. code-block:: matlab

   function out = aprsin(x)
     out  = x - x.^3/6;

y lo guardaremos en el directorio de trabajo con el nombre
``aprsin.m``.  Esta pequeña función nos sirve para entender su
sintaxis.

.. describe:: function

   Identificador de función.  Las funciones sirven para encapsular
   tareas que dependen de argumentos de entrada y devuelven argumentos
   de salida.  La sintaxis es la siguiente

   * Función con tres argumentos de entrada y un argumento de salida::

      function argout = nombre(argin1, argin2, argin3)
        ...
        argout = ...

   * Función con dos argumentos de entrada y dos de salida::

      function [argout1, argout2] = nombre(argin1, argin2)
        ...
        argout1 = ...
        argout2 = ...

   Una función puede depender de cualquier cantidad de argumentos de
   entrada y de salida y debe cumplir siempre estos dos requisitos:

   #. Al final de la función todos los argumentos de salida deben
      tener un valor asignado

   #. El nombre de la función (en los ejemplos ``nombre``) es el
      nombre por el que se podrá llamar la función y el nombre con el
      que deberá guardarse en el directorio de trabajo.

   Cualquier error en uno de los dos puntos anteriores hará que la
   función o bien de un error o no podamos llamarla correctamente.

Ejercicio de síntesis
---------------------
