from __future__ import division

from numpy.fft import fft
from numpy.ma import masked_array
import numpy as N
import scipy as S
import pylab as P

x = N.linspace(0,1/500,100)
lf = 5*N.sin(x*10000)
hf = N.sin(x*1E10)

f = lf+hf
f = masked_array(f,x<0)
print f
print f.mask
