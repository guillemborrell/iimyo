# -*- coding: utf-8 -*-

from os import listdir,system
from sys import argv

PRINTER='otto'

py = [f for f in listdir('.') if '.py' in f and not f == 'build.py']
lyx = [f for f in listdir('.') if '.lyx' in f]

print('-------------[building figures]')
print py
for f in py:
    system('python %s'%(f))

print('-------------[building documents]')
print lyx
for f in lyx:
    system('lyx --export pdf %s'%(f))

if '-print' in argv:
    print('-------------[printing documents]')
    print lyx
    for f in lyx:
        f = f.replace('lyx','pdf')
        system('lpr -P %s -o InputSlot=Default -o Resolution=600dpi\
 -o PageSize=A4 -o Duplex=DuplexNoTumble %s'%(PRINTER,f))
