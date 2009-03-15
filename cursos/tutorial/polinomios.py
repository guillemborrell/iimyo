import numpy as N
import scipy as S
import pylab as P
from scipy import interpolate

k = lambda M: M*(1+1/(1+M**2))**0.23

Mv = S.linspace(0,1,100)
kv = k(Mv)

P.plot(Mv,kv)
P.xlabel('M')
P.ylabel('k')
P.savefig('Mk.pdf')

c = S.polyfit(kv,Mv,2)

kvv = S.linspace(0,1.1,100)
Mvv = S.polyval(c,kvv)

P.figure(2)
P.plot(Mv,kv,'b',Mvv,kvv,'g')
P.xlabel('M')
P.ylabel('k')


exact = interpolate.interp1d(Mv,kv)
appro = interpolate.interp1d(Mvv,kvv)
rg = S.linspace(0.1,1,100)

P.figure(3)
P.plot(Mv,exact(rg)-appro(rg))
P.xlabel('M')
P.ylabel('Error')
P.savefig('error.pdf')

