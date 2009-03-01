Estudio del péndulo invertido
=============================

Un péndulo es uno de los juguetes más básicos para experimentar los
conceptos de periodo y gravedad. ¿Qué sucede si la masa se une a una
barra rígida y se pone al revés?  Entonces se obtiene un péndulo
invertido, un sistema aparentemente inestable que es un ejemplo
clásico para el control automático.

.. latexonly::

   .. figure:: fig/Cart-pendulum.png
      :align: center
      :scale: 200

      Esquema de un péndulo invertido con movimiento horizontal.

.. htmlonly::

   .. figure:: fig/Cart-pendulum.png
      :align: center
      :scale: 70

      Esquema de un péndulo invertido con movimiento horizontal.
  
Una de las claves del péndulo invertido es intentar controlar el
movimiento de la masa moviendo el otro extremo de la barra.  En el
ejemplo del carrito se demuestra que la barra se puede mantener en
posición vertical para una perturbación dada lo suficientemente
pequeña.

Existe otra posibilidad, la de mantener la barra en posición vertical
moviendo la base del péndulo también con una trayectoria vertical como
se muestra en la figura siguiente:

.. latexonly::

   .. figure:: fig/Pendulum-osc.png
      :align: center
      :scale: 200

      Esquema de un péndulo invertido con movimiento vertical.

.. htmlonly::

   .. figure:: fig/Pendulum-osc.png
      :align: center
      :scale: 70

      Esquema de un péndulo invertido con movimiento vertical.

En este caso, la masa tiene la siguiente posición:

.. math::

   (l \sin \theta, y + l \cos \theta)

y la siguiente velocidad:

.. math::

   (l\dot\theta \cos \theta, \dot y + l \dot\theta \sin \theta)

La lagrangiana del sistema es entonces:

.. math::

   L = \frac{1}{2}m \left( \dot y^2 + 2 l \dot \theta \dot y \sin
   \theta + l^2 \dot \theta^2 \right) - mg (y + l \cos \theta)

Y la ecuación del movimiento:

.. math::

   l \ddot \theta - \ddot y \sin \theta = g \sin \theta

El paso siguiente es suponer que el ángulo :math:`\theta` se mantiene
pequeño en cualquier instante

Supuesto un movimiento armónico de la base del péndulo
:math:`y = a \sin \omega t`, obtener el valor del parámetro 
:math:`k = \frac{\omega^2 a}{g}` para el que el péndulo deja de ser
estable.

Representar gráficamente el movimiento de la partícula respecto al
tiempo con *k* = 0.1 y *k* = 100. En todos los casos la longitud del
péndulo será de 0.1 metro, la gravedad de 10 metros por segundo y la
frecuencia de la base de 200 rpm.

Solución
--------

Hay una manera rápida y otra lenta de hacer el problema.  Curiosamente
no por ello significa que la rápida sea fácil y la lenta difícil o
viceversa, simplemente hay que tener algo de conocimientos sobre
estabilidad de sistemas físicos.

La manera fácil es observar que la ecuación diferencial es lineal,
esto significa que su estabilidad estará determinada por sus
autovalores. Manipulando un poco la expresión final linealizada
llegamos a esta ecuación diferencial lineal de segundo orden que
depende de la posición y velocidad de la base del péndulo.

.. math::

   l \ddot \theta + \theta (\omega^2 a \sin \omega t-g)=0

Es muy sencillo determinar la estabilidad del sistema obteniendo sus
autovalores a partir de la ecuación característica.  Si sus
autovalores tienen parte real negativa el sistema será asintóticamente
estable:

.. math::

   \frac{l}{g} \lambda^2 + (\frac{\omega^2 a}{g} \sin \omega t-1) =0

Y finalmente, utilizando el parámetro propuesto *k*

.. math::

   \frac{l}{g} \lambda^2 + \lambda (k \sin \omega t-1) =0

De esta ecuación se obtienen dos raíces complejas conjugadas cuyo
carácter depende del parámetro *k*

.. math::
   
   \lambda = \sqrt{ \frac{g}{l} \left( 1-k \sin \omega t \right)}

Para simplificar aún más la expresión definiremos el parámetro
:math:`\Delta = 1-k\sin \omega t` que servirá para analizar el
carácter de la ecuación:

.. math::

   \lambda = \sqrt{\frac{g}{l}\Delta}

Pero estas raíces son en realidad un lugar geométrico puesto que
dependen de :math:`\omega t` y por lo que se deduce de la ecuación, su
estabilidad viene determinada por la constante *k*.  Es evidente que
el comportamiento del péndulo es algo complejo porque el carácter de
la solución cambia en cada instante. Puede ayudarnos a comprender un
poco más el problema la representación gráfica de :math:`\Delta` y de
los autovalores::

  %% Programa para obtener el lugar de las raices del pendulo invertido
  g = 10;                                                              
  w = 200*2*pi/360;                                                    
  l = 1;                                                               
  t = linspace(0,2*pi/w,100);                                          
  
  figure(1)
  clf;     
  k = {0.1,'b*';
       1,'r*';  
       5,'k*';  
       10,'g*'};
  hold on       
  for iter = 1:4
    plot(t,1-k{iter,1}*sin(w*t),k{iter,2})
  end                                     
  plot([0,2*pi/w],[0,0])                  
  xl = xlabel('t');                       
  yl = ylabel('\Delta');                  
  set(xl,'fontsize',14);                  
  set(yl,'fontsize',14);                  
  legend('k=0.1','k=1','k=5','k=10');     
  hold off
  
  print -dpng 'discriminante.png'
  print -deps 'discriminante.eps'
  
  figure(2)
  clf;
  info={0.1,'b*','k = 0.1';
        1,'r*','k = 1';
        5,'k*','k = 5';
        10,'g*','k = 10'};
  
  for iter = 1:4
    k = info{iter,1};
    marker = info{iter,2};
    titlestring = info{iter,3};
    subplot(2,2,iter);
    plot(real(sqrt(g*(1-k*sin(w*t))/l)),
         imag(sqrt(g*(1-k*sin(w*t))/l)),
         marker);
    t = title(titlestring);
    xl = xlabel('Re');
    yl = ylabel('Im');
    set(t,'fontsize',14);
    set(xl,'fontsize',14);
    set(yl,'fontsize',14);
  end
  print -dpng 'autovalores.png'
  print -deps 'autovalores.eps'

.. latexonly::

   .. figure:: fig/discriminante.pdf
      :align: center
      :scale: 100

      Valor del discriminante

.. htmlonly::

   .. figure:: fig/discriminante.png
      :align: center
      :scale: 70

      Valor del discriminante



Bibliografía
------------

.. [#] Inverted Pendulum. Wikipedia. http://en.wikipedia.org/wiki/Inverted_pendulum .
