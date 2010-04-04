Control de Flujo de Ejecución
=============================

En la introducción hemos incidido en el hecho que Matlab es un
lenguaje de programación pero aún no hemos visto cómo se implementan
algunas de las características que todos los lenguajes tienen en
común.  Todos los lenguajes permiten controlar el flujo de la
ejecución del programa con bucles y condicionales.  En esta sección
aprenderemos las particularidades de Matlab al respecto

Iteradores
----------

En los manuales de Matlab escritos con poco cuidado siempre se trata
la sentencia ``for`` como un método para generar bucles en la
ejecución del programa.  Rigurosamente hablando se trata de un
iterador.

La manera más habitual de utilizar la sentencia es como sigue:

.. code-block:: matlab

  for i = 1:5
    disp(i)
  end

       1
       2
       3
       4
       5

Esto parece un bucle así que aún no entenemos muy bien en qué se
diferencia un bucle de un iterador.  La parte más importante de un
bucle es un índice que se va incrementando a medida que el flujo de
ejecución entra en él.  Si el ejemplo anterior fuera un bucle cada vez
que la ejecución pasa por la sentencia ``for`` la variable ``i`` se
incrementaría en una unidad seguiría corriendo.  Pero no es esto lo
que sucede

.. code-block:: matlab

  for i = 1:5
    disp(i)
    i=i+5;
  end

       1
       2
       3
       4
       5

Hemos incrementado el índice manualmente pero la sentencia ``for`` ha
asignado el nuevo número al índice cada vez que el flujo de ejecución
ha pasado por él. *La sentencia ``for`` itera el índice ``i`` por la
secuencia ``1:5`` *.

Lo entenderemos aún mejor con el siguiente ejemplo

.. code-block:: matlab

  for i = [1,4,3,2,9]
    disp(i)
  end

       1
       4
       3
       2
       9

Le hemos pasado a la sentencia ``for`` un iterable, en este caso un
vector, y el índice ha ido avanzando por el mismo hasta el final.  En
otros lenguajes de programación podemos definir iterables para
simplificar el control de flujo pero en Matlab sólo podemos iterar
sobre vectores.

También podemos iterar sobre matrices pero sin contradicción con la
afirmación anterior.  Lo único que hará Matlab será avanzar el índice
por cada una de las columnas.

Condicionales
-------------

El otro elemento esencial del control de flujo en cualquier lenguaje
de programación es la ejecución condicional de bloques de código.  En
Matlab, como en cualquier lenguaje de programación creado por una
mente mínimamente sana, la palabra clave correspondiente es ``if``.  A
continuación un breve ejemplo

.. code-block:: matlab

  a = zeros(4,4);
  for i = 1:4
    for j = 1:4
      if i==j
        a(i,j) = 2;
      elseif j == 4
        a(i,j) = -1;
      else
        a(i,j) = 0;
      end
    end
  end

  a =
     2     0     0    -1
     0     2     0    -1
     0     0     2    -1
     0     0     0     2

Este fragmento de código es bastante autoexplicativo.
