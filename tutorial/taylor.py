# -*- coding: utf-8 -*-

from numpy import *
from scipy import *
import pylab as P

@vectorize
def exp_serie(x,n):
    return 1 + sum(x**linspace(1,n,n)/factorial(linspace(1,n,n)))

x = linspace(0,3,100)
P.plot(x,exp(x),
       x,exp_serie(x,1),
       x,exp_serie(x,2),
       x,exp_serie(x,3),
       x,exp_serie(x,4),
       x,exp_serie(x,5))
P.legend(('exacta','n=1','n=2','n=3','n=4','n=5',),loc=0)
P.title(u'Desarrollos de Taylor de la función exponencial en x=0')
P.xlabel('x')
P.ylabel('y')
P.savefig('desarrollo.svg')

P.figure(2)
P.semilogy(x,exp(x)-exp_serie(x,1),
           x,exp(x)-exp_serie(x,2),
           x,exp(x)-exp_serie(x,3),
           x,exp(x)-exp_serie(x,4),
           x,exp(x)-exp_serie(x,5),)
P.legend(('n=1','n=2','n=3','n=4','n=5',),loc=0)
P.hold('on')
P.semilogy([0.1,0.1,0.1,0.1,0.1],[
        exp(0.1)-exp_serie(0.1,1),
        exp(0.1)-exp_serie(0.1,2),
        exp(0.1)-exp_serie(0.1,3),
        exp(0.1)-exp_serie(0.1,4),
        exp(0.1)-exp_serie(0.1,5),
        ],
           'ko',markersize=5)
P.semilogy([0.2,0.2,0.2,0.2,0.2],[
        exp(0.2)-exp_serie(0.2,1),
        exp(0.2)-exp_serie(0.2,2),
        exp(0.2)-exp_serie(0.2,3),
        exp(0.2)-exp_serie(0.2,4),
        exp(0.2)-exp_serie(0.2,5),
        ],
           'bo',markersize=5)
P.xlabel('x')
P.ylabel(r'$\exp(x)-p_n(x)$')
P.title(u'Error de las aproximaciones')
P.savefig('error.svg')

P.figure(3)
P.semilogy([0,1,2,3,4,5,6,7,8],[exp(0.1),
                                exp(0.1)-exp_serie(0.1,1),
                                exp(0.1)-exp_serie(0.1,2),
                                exp(0.1)-exp_serie(0.1,3),
                                exp(0.1)-exp_serie(0.1,4),
                                exp(0.1)-exp_serie(0.1,5),
                                exp(0.1)-exp_serie(0.1,6),
                                exp(0.1)-exp_serie(0.1,7),
                                exp(0.1)-exp_serie(0.1,8)],
           'ko',markersize=5)
P.hold('on')
P.semilogy([0,1,2,3,4,5,6,7,8],[exp(0.2),
                                exp(0.2)-exp_serie(0.2,1),
                                exp(0.2)-exp_serie(0.2,2),
                                exp(0.2)-exp_serie(0.2,3),
                                exp(0.2)-exp_serie(0.2,4),
                                exp(0.2)-exp_serie(0.2,5),
                                exp(0.2)-exp_serie(0.2,6),
                                exp(0.2)-exp_serie(0.2,7),
                                exp(0.2)-exp_serie(0.2,8)],
           'bo',markersize=5)
P.legend(('punto 0.1', 'punto 0.2',),loc=0)
P.axis((-0.1,8.1,1e-16,1e1))
P.xlabel('Orden')
P.ylabel(r'$\exp(x)-p_n(x)$')
P.title(u'Convergencia de aproximaciones')
P.savefig('convergencia.svg')

P.show()
