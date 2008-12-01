import numpy as N
import pylab as P

x = N.linspace(0,2*N.pi,100)
P.plot(x,N.sin(x))
#P.savefig('sin.pdf')

P.plot(x,N.sin(x),'b-',x,N.cos(x),'r*',x,N.sin(pi+x),'g+')
P.show()
