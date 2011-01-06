# -*- coding: utf-8 -*-

import numpy as N
import pylab as P

P.figure(1)
P.plot([1,2,3,2,1])
P.savefig('simpleplot.svg')

P.figure(2)
x = P.linspace(-N.pi,N.pi,64)
P.plot(x,N.sin(x))
P.savefig('sinplot.svg')

P.figure(3)
P.plot(x,N.sin(x),'ro',markersize=5)
P.savefig('sinplot_dots.svg')

P.figure(4)
x = P.linspace(0,500,10000)
P.plot(x,N.exp(-x/100)*N.sin(x))
P.title(u'Una función cualquiera')
P.xlabel('Tiempo')
P.ylabel('Amplitud')
P.savefig('labels.svg')

P.figure(5)
x = P.linspace(-N.pi,N.pi,100)
P.plot(x,N.sinh(x),x,N.cosh(x))
P.legend([u'Seno hiperbólico',u'Coseno hiperbólico'])
P.savefig('legend.svg')

P.figure(6)
theta = P.linspace(-N.pi,N.pi,100)
p1 = P.polar(theta,N.cos(2*theta))
P.savefig('polar.svg')


P.show()
