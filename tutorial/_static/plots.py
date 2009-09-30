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

P.show()
