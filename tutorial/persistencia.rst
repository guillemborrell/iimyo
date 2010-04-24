Persistencia
============

En programación, la persistencia se refiere a la capacidad de guardar
el contenido de una variable en un archivo.  Este concepto difiere
ligeramente de la entrada/salida en la que se utilizan llamadas al
sistema para escribir directamente al archivo. Mientras en los
lenguajes estáticos la manera habitual de guardar datos en disco es la
entrada/salida, en los interpretados la persistencia suele ser una
mejor opción. El motivo es que es mucho más sencillo crear una
variable con los datos que queremos guardar que *diseñar* el archivo
de datos.  Entre ambos métodos no hay una diferencia apreciable de
velocidad.

.. important::

  La persistencia es también el método de distribuir resultados.  Hay
  tres criterios para escoger la manera de guardar resultados: la
  velocidad, el espacio utilizado y la distribución de los archivos
  generados.  Podemos gardar nuestros datos utilizando multitud de
  formatos y archivos, cada uno con ventajas e inconvenientes respecto
  a estos tres criterios.  El interrogante más importante que debemos
  resolver es si los datos generados son sólo necesarios para el
  funcionamiento del código o son parte de un resultado que queremos
  distribuir.

Archivos binarios
-----------------

Podemos guardar los datos de dos maneras: utilizando un formato leíble
para los humanos (normalmente ASCII) o utilizando un formato binario
comprensible por el ordenador.  Es necesario enfatizar que esto se
trata únicamente de la manera de *escribir*, un archivo binario y otro
en ASCII pueden contener exactamente los mismos datos.  La diferencia
es que mientras que podemos leer un archivo ASCII sólo viendo cómo
está escrito es imposible realizar ingeniería inversa con un archivo
binario.

Lo anterior significa que para leer un archivo binario tenemos que
saber de antemano cómo leerlo.  La solución más habitual a este
problema es utilizar un formato conocido y explicitándolo en la
extensión.  Por ejemplo, si utilizamos el formato propio de Matlab
podemos utilizar la extensión ``.mat``, mientras que si utilizamos el
formato HDF5 la extensión más habitual es la ``.h5``.

La gran ventaja de utilizar un formato conocido es que permite
almacenar más información sobre la variable almacenada como por
ejemplo las dimensiones.  También nos permite guardar más de una
variable en un único archivo reduciendo la complejidad de la
persistencia de nuestros scripts.

.. important::
 
  Un archivo binario suele ocupar unas ocho veces menos espacio en
  memoria que uno en ASCII con los mismos datos.

Matlab dispone de un formato binario propio que tradicionalmente ha
cambiado con cada versión.  Este formato, aunque no es parte de ningún
estándar, es bastante popular y está perfectamente soportado tanto por
Octave como por otras libereías de Cálculo Numérico como Numpy/Scipy.

.. warning::

  Que el formato de archivo cambie cada versión implica que se rompe
  la compatibilidad hacia atrás.  Si guardamos un archivo en Matlab
  7.7 no podrá leerse con un Matlab 7.0 y obviamente tampoco con un
  Matlab 6.5. Si necesitamos soportar versiones anteriores de Matlab
  lo tendremos que indicar al utilizar el comando de escritura en
  disco correspondiente.

  Obviamente sí existe compatibilidad hacia adelante, esto es, un
  archivo escrito por Matlab 6.5 podrá leerse sin problemas en Matlab
  7.7.

Es preferible, si queremos distribuir públicamente resultados
obtenidos con Matlab, utilizar un formato de archivo binario de
estándar abierto.  El motivo es que, aunque podamos abrir los archivos
binarios de Matlab fácilmente con otros lenguajes interpretados,
hacerlo en Fortran o en C++ es bastante más complicado puesto que la
librería que permite leerlos no es redistribuible.  El formato más
popular actualmente es HDF5.

.. note::

  Una de las ventajas de HDF5 es que dispone de una API para
  prácticamente cualquier lenguaje de programación.  Está lentamente
  convirtiéndose en el formato de intercambio por excelencia entre
  proyectos de investigación.  Debemos tener en cuenta que no siempre
  quien reciba sus datos contará con una licencia de Matlab ni con
  Octave para poder leerlos.
