# -*- coding: utf-8 -*-

from __future__ import division
from pylab import *

def check(op,cl,dif,n):
    if dif == 0:
        dst = cl-op
    else:
        dst = cl[dif:] - op[:-dif]

    (freq,bins) = histogram(dst,30)
    bins = 0.5*(bins[1:]+bins[:-1])
    pdf = -freq/trapz(bins,freq)
    semilogy(bins,pdf)


if __name__ == '__main__':
    op = load('googopen.dat')
    cl = load('googclse.dat')
    clf()
    hold('on')
    check(op,cl,0,30)
    check(op,cl,1,30)
    check(op,cl,4,30)
    check(op,cl,9,30)

    legend(('0 dias','1 dia','5 dias','9 dias'))

    show()
