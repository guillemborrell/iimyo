from __future__ import division
from numpy import ones,zeros,arange,pi,real,abs,max,r_
from numpy import linspace,sin,array,mod,fft
from scipy import integrate
import pylab

def L(uhat,kx):
    return -(kx**2)*uhat

def D(uhat,kx,N,filt):
    """
    Function that computes the non linear term for the Burgers
    equation given the spectra of the variable. The dealiasing cuts
    the half of the spectra.
    """
    u = fft.ifft(uhat)
    dudx = fft.ifft(1.0j * kx * uhat)
    return fft.fft(u*dudx)*filt

def burgers(N,u0,tend,dt,Re):
    # Initial condition and coefficients
    filt = r_[ones(N/4+1),zeros(N/2-1),ones(N/4)]
    x = linspace(-pi,pi,N+1)
    x = x[0:N]
    kx = r_[1,arange(1,N/2+1),arange(-N/2+1,0)]
    uhat0 = fft.fft(u0(x))

    # Time integration
    eq = lambda t,uhat: L(uhat,kx)/Re-D(uhat,kx,N,filt) 
    r = integrate.ode(eq)
    r.set_integrator('zvode')
    r.set_initial_value(uhat0,0.0)

    # Plot setup
    pylab.figure(2)
    pylab.clf()
    pylab.hold('on')

    times = [0]
    tthres = tend/10

    pylab.plot(x,real(fft.ifft(uhat0)),label="t"+str(0))

    while r.successful() and r.t < tend:
        r.integrate(r.t+dt)
        
        if r.t > tthres:
            uhat0 = r.y
            
            # Plot the results
            pylab.plot(x,real(fft.ifft(uhat0)),
                       label="t"+str(tthres))
            tthres += tend/10
            times.append(r.t)
            print "plot at %f"%(r.t)

    uhat0 = r.y

    t = pylab.title(r'$u(t)$')
    pylab.setp(t,'fontsize',16)
    y = pylab.ylabel(r'$u$')
    pylab.setp(y,'fontsize',16)
    x = pylab.xlabel(r'$x$')
    pylab.setp(x,'fontsize',16)

    pylab.figure(1)
    pylab.clf()
    pylab.plot(abs(fft.fftshift(uhat0)))            
    t = pylab.title('Power spectra of u at tend')
    y = pylab.ylabel(r'$\hat{u}$')
    pylab.setp(y,'fontsize',16)
    x = pylab.xlabel(r'$k_x$')
    pylab.setp(x,'fontsize',16)
            
    pylab.show()
            
    return times

if __name__ == '__main__':
    N = 128
    tend = 1
    dt = 0.001
    u0 = lambda x: 10*sin(x)
    times = burgers(N,u0,tend,dt,1)
