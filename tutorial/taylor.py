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
P.show()
