# -*- coding: utf-8 -*-
from __future__ import division

from numpy.fft import fft,ifft
from numpy.ma import compress
import numpy as N
import scipy as S
import pylab as P

x = N.linspace(0,1/500,1000)
lf = 5*N.sin(2*N.pi*x*10000)
hf = N.sin(2*N.pi*x*1E6)

f = lf+hf
f = compress(f,f>0)
f = fft(f)
f[0]=0 # Quito el término constante
P.figure(1)
P.plot(abs(f))
P.title(u'Espectro antes del filtrado')
P.savefig('espectro.pdf')

ffilt = f.copy()
ffilt[:] = 0

ffilt[5:27] = f[5:27]
ffilt[-26:-4] = f[-26:-4]

ffilt[0] = 0

filtered = ifft(ffilt)
P.figure(2)
P.plot(filtered)
P.title(u'Señal filtrada')
P.savefig('am.pdf')
