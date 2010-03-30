Primer Contacto
===============

La interfaz gráfica de Matlab
-----------------------------

La interfaz gráfica de Matlab es prácticamente idéntica en cualquiera
de sus versiones independientemente del sistema operativo.

.. only:: latex

  .. figure:: _static/principal_col.png
     :align: center
     :scale: 100

     Captura de la interfaz gráfica de Matlab R2008b

.. only:: html

  .. figure:: _static/principal_col.png
     :align: center
     :width: 800px

     Captura de la interfaz gráfica de Matlab R2008b

Vemos que la ventana principal está dividida en apartados con una
función específica. Cada uno de estos apartados, a excepción del menú,
es una ventana que puede moverse dentro de la propia aplicación.  Esto
permite que ordenemos Matlab para ajustarlo mejor a nuestras
necesidades.  Las tres únicas zonas que de momento nos interesan están
marcadas con un número en la imagen.

El icono señalado con el número 1 siginfica nuevo archivo y sirve para
abrir el editor de Matlab.  Será nuestra herramienta de trabajo y
pronto le dedicaremos una sección.

El recuadro señalado con el número 2 es el diálogo para seleccionar el
directorio de trabajo.  A medida que vayamos escribiendo código lo
guardaremos en algún lugar del ordenador.  Para poder utilizarlos en
un futuro es importante que Matlab sepa dónde lo hemos dejado.  Matlab
ya sabe, porque así viene configurado de fábrica, dónde tiene
guardadas las funciones propias de la aplicación y de los distintos
toolkits pero no sabe dónde están las que hemos escrito.

.. warning::

   Matlab busca funciones y scripts en los directorios especificados
   por la función ``path``.  El primero de ellos es siempre el
   especificado en el diálogo ``Current Directory``.

.. function:: path(path, dir)

   Sin argumentos imprime en la pantalla los directorios donde Matlab
   busca los archivos.  En el caso de darle dos argumentos,
   normalmente el primero será simplemente ``path`` mientras que el
   segundo será el nombre de un directorio que queramos añadir a la
   lista.

   Por ejemplo, para añadir un directorio en un sistema operativo UNIX

   .. code-block:: matlab

      >> path(path,'/home/yo/funciones_matlab')


   Para añadir un directorio en un sistema Windows

   .. code-block:: matlab

      >> path(path,'c:\yo\funciones_matlab')

Por último, pero no menos importante, el número 3 es la consola de
Matlab.  Como quedó claro en la introducción, en realidad Matlab no es
más que un intérprete para un lenguaje de programación y nuestra vía
directa de comunicación con el mismo es la consola.  De hecho, no
existe ninguna acción de la interfaz gráfica que no pueda ejecutarse
también mediante la consola.  De hecho, cuando ejecutamos un programa
no es ni siquiera imprescindible que la interfaz gráfica esté
abierta.

.. tip::

   Uno de los atajos de teclado más útiles del editor de matlab es
   utilizar la tecla F5 para guardar y ejecutar el código que estamos
   escribiendo.

La siguiente pieza es el editor.  

.. only:: latex

  .. figure:: _static/editor.png
     :align: center
     :scale: 100

     Captura del editor de Matlab R2008b

.. only:: html

  .. figure:: _static/editor.png
     :align: center
     :width: 800px

     Captura del editor de Matlab R2008b

La definición de programar es escribir código y para ser realmente
productivos es importante utilizar una buena herramienta y conocerla.
No es ni mucho menos necesario utilizar el editor de Matlab para
escribir nuestros scripts pero se trata de una buena opción.

El editor cuenta con casi todas las capacidades que se esperan de una
herramienta de programación moderna.

* Coloreado de código

* Análisis sintáctico capaz de detectar errores antes de ejecutar el código

* Depurador integrado

Una de las características que ha integrado en las últimas versiones
es el modo celda que nos ayudará a dividir grandes archivos en partes
ejecutables independientemente sólo comentando el código de una manera
particular.

La interfaz gráfica nos sirve también para consultar la documentación
del programa.  Es completa, extensa y de calidad. Hablaremos con más
calma sobre la ayuda de Matlab en el siguiente capítulo.

La arquitectura de Matlab
-------------------------

Por motivos de licencias, Matlab está dividido en paquetes.  Cada uno
cumple una función específica y puede ser adquirido a parte.  Esto
impone una limitación añadida a Matlab porque, aunque una empresa o
una universidad se haya gastado grandes cantidades de dinero en
licencias de Matlab, es posible que no haya adquirido el toolbox que
necesitamos.

Simulink
........

Simulink es una herramienta de diseño y modelado de sistemas
dinámicos.  Simulink utiliza Matlab para realizar los cálculos, puede
extenderse con Matlab y se distribuye junto con Matlab, pero no es
Matlab.  Simulink se basa en conectar modelos, expresados por bloques,
que se transmiten información.

Simulink tiene sus limitaciones.  No siempre un sistema se puede
llegar a modelar de manera eficiente sólo con bloques y conexiones
debido a que no siempre la información transmitida es equivalente a la
información que pasa por un cable.  Nunca debe presentarse Simulink
como una alternativa a la programación directa de un modelo sino como
una plataforma de modelado de sistemas simples o de integración para
que varios ingenieros trabajen sin colisionar en el mismo sistema.

Octave
------

En su propia documentación se describe Octave como un lenguaje de
programación de alto nivel orientado al Cálculo Numérico.  Proporciona
una consola para resolver problemas lineales y no lineales con el
ordenador y para desarrollar experimentos numéricos.

Octave puede ser copiado, modificado y redistribuído libremente bajo
los términos de la licencia GNU GPL tal como se publica por la Free
Software Foundation.

Octave fue diseñado para ser una herramienta dentro de la línea de
comandos del sistema operativo GNU, aunque posteriormente ha sido
portado a muchos más sistemas operativos. También en un principio fue
un lenguaje de programación independiente pero ha ido convergiendo a
Matlab hasta el punto de buscar la compatibilidad con él.  Tampoco ha
sido nunca un objetivo dotarle de interfaz gráfica pero podemos
encontrar ya un par de ellas con calidad suficiente.

Aunque Octave es capaz de ejecutar la mayoría del código escrito en
Matlab tanto su historia como su arquitectura interna es completamente
distinta.  Una de las diferencias más evidentes es que están escritos
en lenguajes de programación distintos, Matlab en C y Octave en C++.

Octave es hoy en día una herramienta inferior a Matlab pero para
tratarse de algo totalmente gratuito desarrollado por una comunidad de
ingenieros, científicos y entusiastas se trata de una herramienta de
una calidad altísima.  Para pequeños proyectos es una alternativa
completamente viable a Matlab además cuenta con la ventaja de utilizar
el mismo lenguaje de programación. Otras plataformas de cálculo para
Ciencia e Ingeniería como Scilab o IDL cuentan con sus propios
lenguajes de programación.

QtOctave
........

Se trata de la interfaz gráfica más completa disponible para Octave en
la actualidad.  No es parte de Octave sino que se trata de un proyecto
independiente y separado.  Al igual que Octave se trata de software
que puede copiarse, modificarse y distribuirse siempre que se haga
respetando la licencia GNU GPL.

Al igual que Matlab proporciona acceso a la consola y un editor.
Aunque aún no dispone de depurador integrado sí proporciona un sistema
de control de versiones que puede resultarnos útil cuando el código
que escribimos se acerca a los millares de líneas.

Nuestro primer programa en Matlab
---------------------------------

Antes de escribir código o implementar algún algoritmo es necesario
que nos familiaricemos con el entorno de desarrollo.  Este primer
programa constará de una función y de un script que llama a la
función.  Así construiremos una estructura de programa que se repite
en la gran mayoría de casos; nuestros programas serán una colección de
funciones que son llamadas por un script que funcionará como un
programa principal.

.. note::

   El lector que haya programado alguna vez en C o cualquier lenguaje
   basado en C como C++ o Java reconocerá esta manera de trabajar.  La
   diferencia es que en Matlab no hacen falta cabeceras de ningún tipo
   y el programa principal puede llamarse de cualquier manera.  La
   limitación es que, al no poder crear cabeceras, todas las funciones
   deberán encontrarse ya en los directorios especificados por
   ``path``.

Abriremos el editor y en él escribiremos lo siguiente

.. code-block:: matlab

   aprsin = @(x) x - x.^3/6;
   x = linspace(-pi,pi,100);
   plot(x,[aprsin(x);sin(x)]);
   
Guardaremos el script con el nombre que más nos apetezca, siempre con
la extensión ``.m``.  Luego, en la consola, escribiremos el nombre que
hemos utilizado para el archivo sin la extensión.  Si todo ha salido
bien aparecerá lo siguiente.


.. only:: latex

  .. figure:: _static/aprsin.pdf
     :align: center
     :scale: 70

     Resultado del script

.. only:: html

  .. figure:: _static/aprsin.png
     :align: center

     Resultado del script


Nuestro primer programa en Octave
---------------------------------

A diferencia de Matlab, Octave es programa diseñado para ser utilizado
en la consola del sistema.  Dicho de esta manera parece que volvemos a
los años 80 antes que se popularizara Windows pero si nos fijamos un
poco en la interfaz de Matlab veremos que a medida que nos volvamos
más hábiles en el uso del lenguaje de programación usaremos más el
intérprete de comando y menos los accesorios que lo rodean.

En Octave uno de los comandos más usados es edit, que también existe
en Matlab.

.. function:: edit

  Función que controla el editor asociado al intérprete.  En el caso
  de Matlab se trata del intérprete propio mientras que Octave utiliza
  el intérprete predeterminado del sistema.  Por ejemplo, para editar
  la función nueva ``aprsin.m`` escribiremos

  .. code-block:: matlab

    >> edit aprsin.m
