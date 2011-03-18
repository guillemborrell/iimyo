Persistencia
============

En programación, la persistencia se refiere a la capacidad de guardar
el contenido de una variable en un archivo.  

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

.. important::
 
  Un archivo binario suele ocupar unas ocho veces menos espacio en
  memoria que uno en ASCII con los mismos datos.

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

