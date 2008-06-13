.. raw:: html

  <script src="files/ASCIIMathML.js"></script>

================================================
Introducción a Octave para la Docencia en la UCA
================================================

Tercera sesión
^^^^^^^^^^^^^^

Guillem Borrell i Nogueras

10-13 de Junio de 2008

Temario
=======

* Lenguaje Matlab.

* Sistemas de ecuaciones lineales.

* Integración numérica.

* Polinomios, interpolación y regresión.

* Representación gráfica.

* EDOs.

* Análisis de señales.

* ¿Sugerencias?

Ayuda
=====

La ayuda de la función es cualquier comentario antes de la primera
sentencia ejecutable.

::

  function y=foo(x)
  
  % funcion foo
  % no hace absolutamente nada
  
  y=z
  
Análisis de señales
===================

* FFT, uno de los algoritmos más utilizados en cálculo numérico.

* Algoritmo |order|. Casi *O(n)* para *n* grandes.

* Dos colecciones de funciones: transformadas y filtros

* En Octave-forge: *signal*.

.. |order| raw:: html

  `O(n log(n))`



Ejercicio: señal modulada en amplitud
=====================================

1. Generar la señal y la portadora.

  1. La señal es |senal|

  2. La portadora es |portadora|

2. Sumar la señal y la portadora.

3. Rectificar la señal.

.. |senal| raw:: html

  `sin(x)/5, x \in [0,2\pi] (1Hz)`

.. |portadora| raw:: html

  `sin(100x), x \in [0,2\pi] (100Hz)`

Control lineal
==============

* Octave cuenta con las funciones básicas para el análisis de bloques
  en plantas.

* También es capaz de simular sistemas discretos *T_SAM*.

::

  >> controldemo

Ejercicio
=========

Dado un sistema lineal cuya función de transferencia es: |tf|

.. |tf| raw:: html

  `\frac{s+1}{s^2+2s+1}`

* Crear el sistema mediante la función *tf*

* Obtener la respuesta en frecuencia y fase con *bode*

* Obtener el diagrama de *nyquist*.

* Obtener las respuestas a impulso y a escalón con *impulse* y *step*.

* Obtener el lugar de las raíces con la función *rlocus*
