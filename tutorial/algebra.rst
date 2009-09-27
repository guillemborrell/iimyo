Matrices y Álgebra Lineal
=========================

Para seguir avanzando hacia el Álgebra Lineal es necesario definir el
concepto de Matriz en Matlab.  Técnicamente no hay ninguna diferencia
entre vectores, matrices o tensores.  De hecho todos los tipos
numéricos en Matlab son arrays sin distinción, cada dimensión que no
exista no es más que un índice que se mantiene en 1.  Para entenderlo
mejor podemos hacer este pequeño experimento

.. code-block:: matlab

   >> a = 1;
   >> a
   a =  1
   >> a(1)
   ans =  1
   >> a(1,1)
   ans =  1
   >> a(1,1,1)

Hemos definido un escalar y lo hemos llamado como un escalar, un
vector, una matriz y un array tridimensional.  A Matlab le ha dado
igual que en su definición pretendiéramos crear un escalar.

Desde este punto de vista, todos los vectores son en realidad matrices
que tienen sólo una fila o una columna.  La concatenación de vectores
fila o vectores columna generará una matriz.  El inconveniente es que
hasta ahora sólo conocemos vectores fila.

Si en un vector fila los elementos se separan con comas (o con
espacios) para generar un vector columna debemos separar los elementos
por puntos y comas.

.. code-block:: matlab

   >> v = [1;2;3]
   v =
   
      1
      2
      3
   
Como además hemos aprendido que para concatenar vectores sólo tenemos
que pegarlos ya podemos generar matrices pegando vectores fila o
vectores columna.  Por ejemplo:

.. code-block:: matlab

   >> [v,v,v]
   ans =
   
      1   1   1
      2   2   2
      3   3   3

Acabamos de crear nuestra primera matriz.  Matlab dispone de un
literal para las matrices que nos ahorra tener que escribir un vector
para cada fila o columna.  En este literal los elementos de una misma
fila se separan con comas y las filas se separan mediante puntos y
coma como se ve en el ejemplo siguiente:

.. code-block:: matlab

   >> u = [1,2,3;4,5,6;7,8,9]
   u =
   
      1   2   3
      4   5   6
      7   8   9

Al igual que con los vectores, Matlab dispone de una ingente colección
de funciones que, combinadas adecuadamente, nos serviran para generar
prácticamente cualquier matriz.

.. function:: zeros(...)

   La función zeros se puede llamar de muchas maneras.  Si sólo se
   utiliza un índice crea una matriz cuadrada de dimensiones el valor
   del argumento de entrada.
