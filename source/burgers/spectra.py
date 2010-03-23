import numpy as N
import pylab as P

x = N.linspace(-N.pi,N.pi,33)[0:-1]
y = N.exp(-x**2)
P.figure(1)
P.clf()
P.plot(x,y)
xl = P.xlabel(r'$\phi$')
P.setp(xl,'fontsize',16)
yl = P.ylabel(r'$u$')
P.setp(yl,'fontsize',16)

spec = N.fft.fft(y)
yp = -2*x*N.exp(-x**2)
specp = N.fft.fft(yp*y)
P.figure(2)
P.clf()
P.hold('on')
P.plot(N.abs(N.fft.fftshift(spec)))
P.plot(N.abs(N.fft.fftshift(specp)))
xl = P.xlabel(r'$k$')
P.setp(xl,'fontsize',16)
yl = P.ylabel(r'$|\hat u|,\ |\hat u \hat u_\phi|$')
P.setp(yl,'fontsize',16)
leg = P.legend([r'$|\hat u|$',r'$|\hat u \hat u_\phi|$'])
P.hold('off')

P.show()
