#!/usr/bin/python

from os import system,chdir,listdir
from sys import argv

help = False
if '-h' in argv or '--help' in argv:
    help = True
    print """
    This application is used to generate all the figures for the book
    IIMyO.

    Ran without arguments generates the figures in pdf. You can use the
    following options:

    * --help, -h: Displays this help

    * --eps, -e: Figures in eps. Needed to build the book in html.
    """
    
eps=False
if '-e' in argv or '--eps' in argv: eps=True


dia=['Diagram1','Diagram2','Diagram3','Diagram4','Diagram6',
     'Diagram7','Diagram8','Diagram9','Diagram10','Diagram12',
     'Diagram13']
octave=['figuraejemplo1','figuraejemplo2','calor','calorevol',
        'bodeplot','nyquistplot','excontour','excontour2',
        'exrandsparse','fitting','interpeq','chebyshevnodes',
        'operaciones']
python=['figuraejemplo3','figuraejemplo4','figuraejemplo5',
        'figuraejemplo6','figuraejemplo7','fzero']

if eps and not help:
    for filename in listdir('.'):
        if '.pdf' in filename:
            filename=filename[:-4]
            try:
                print filename
                system('pdftops %s.pdf'%(filename))
                system('ps2epsi %s.ps'%(filename))
                system('rm %s.ps'%(filename))
                system('mv %s.epsi %s.eps'%(filename,filename))
                print 'figure %s converted to eps'%(filename)
            except:
                print 'figure %s not converted'%(filename)


if not help:
    for diagram in dia:
        try:
            system('dia --export=%s.eps --filter=eps %s.dia'%(diagram,diagram))
            if not eps:
                system('epstopdf %s.eps'%(diagram))
                system('rm %s.eps'%(diagram))
            print('*****************')
            print('diagram generated for %s'%(diagram))
            print('*****************')
        except:
            print('diagram %s failed, check that dia is installed'%(diagram))

if not help:
    for script in octave:
        try:
            system('octave -q %s.m'%(script))
            if not eps:
                system('epstopdf %s.eps'%(script))
                system('rm %s.eps'%(script))
            print('*****************')
            print('figure generated for %s'%(script))
            print('*****************')
        except:
            print('figure %s failed, check that octave is installed'%(script))
    
    for script in python:
        try:
            system('python %s.py'%(script))
            print('*****************')
            print('figure generated for %s'%(script))
            print('*****************')
        except:
            print('figure %s failed, check that matplotlib is installed'%(script))
                    
# tratamiento especial para ejercicio_espectral
# cuidado con el cambio de directorio, esta parte
# debe estar siempre al final

chdir('ejercicio_espectral_scripts')
if not help:
    try:
        system('octave -q main.m')
        if not eps:
            system('epstopdf solucion.eps')
            system('epstopdf error.eps')
            system('epstopdf convergencia.eps')
        print('************')
        print('figuras para ejercicio espectral generadas')
        print('************')
    except:
        print('figures for ejercicio espectral failed')

