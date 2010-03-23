import numpy as N
import pylab as P

x = N.linspace(0,2*N.pi,100)[0:-1]
P.plot(x,N.sin(x),x,N.cos(x),x,N.sin(x)*N.cos(x))

xl = P.xlabel(r'$\phi$')
P.setp(xl,'fontsize',16)

yl = P.ylabel(r'$u,\ u_\phi,\ uu_\phi$')
P.setp(yl,'fontsize',16)

le = P.legend([r'$u$',r'$u_\phi$',r'$uu_\phi$'])

P.show()
