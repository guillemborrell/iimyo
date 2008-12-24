# -*- coding: utf-8 -*-

from os import listdir,system
from sys import argv

PRINTER='otto'

py = [f for f in listdir('.') if '.py' in f and not f == 'build.py']
lyx = [f for f in listdir('.') if '.lyx' in f]

def usage():
    print """

build.py: script to build or print a collection of lyx documents. On
the command prompt write

$ python build.py build

to build the documents

$ python build.py print

to print de documents using the printer used in the variable PRINTER
found in the source

$ python build.py zip

to zip all the documents into a single zip file.

To display this help type in the prompt:

$ python build.py help

    """

if 'build' in argv:
    print('-------------[building figures]')
    print py
    for f in py:
        system('python %s'%(f))

    print('-------------[building documents]')
    print lyx
    for f in lyx:
        system('lyx --export pdf %s'%(f))

if 'print' in argv:
    print('-------------[printing documents]')
    print lyx
    for f in lyx:
        f = f.replace('lyx','pdf')
        system('lpr -P %s -o InputSlot=Default -o Resolution=600dpi\
 -o PageSize=A4 -o Duplex=DuplexNoTumble %s'%(PRINTER,f))

if 'zip' in argv:
    print('-------------[zipping documents]')
    s = ''
    for f in lyx:
        f = f.replace('lyx','pdf')
        s += ' '+f

    system('zip tutorial.zip %s'%(s))

if 'help' in argv:
    usage()

else:
    usage()
