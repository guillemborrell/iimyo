# -*- coding: utf-8 -*-

from pylab import *

p = plot([1,2,3,2,1])
setp(p,'linewidth',2)
setp(p,'marker','o')
setp(p,'markersize',12)
setp(p,'markerfacecolor','y')
setp(p,'markeredgecolor','r')
t = title(u'Pirámide')
setp(t,'fontsize',14)
setp(t,'color','g')

savefig('piramide.svg')

show()
