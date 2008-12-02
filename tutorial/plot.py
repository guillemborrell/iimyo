# -*- coding: utf-8 -*-

import numpy as N
import pylab as P

x = N.linspace(0,2*N.pi,100)

P.figure(1)
sp = P.plot(x,N.sin(x))
P.savefig('sin.pdf')

P.figure(2)
P.plot(x,N.sin(x),'b-',x,N.cos(x),'rx',x,N.tan(x),'g+')
P.axis('auto')
P.savefig('noaxis.pdf')

P.figure(3)
P.plot(x,N.sin(x),'b-',x,N.cos(x),'rx',x,N.tan(x),'g+')
P.axis((0,2*N.pi,-1.5,1.5))
P.savefig('axis.pdf')

P.title(u'Funciones trigonométricas')
P.xlabel('x')
P.ylabel('y')
P.legend(('sin','cos','tan'))
P.savefig('legend.pdf')
