from os import system,chdir

dia=['Diagram1','Diagram2','Diagram3','Diagram4','Diagram6',
     'Diagram7','Diagram8','Diagram9','Diagram10','Diagram12',
     'Diagram13']
octave=['figuraejemplo1','figuraejemplo2','calor','calorevol',
        'bodeplot','nyquistplot','excontour','excontour2',
        'exrandsparse','fitting','interpeq','chebyshevnodes',
        'operaciones']
python=['figuraejemplo3','figuraejemplo4','figuraejemplo5',
        'figuraejemplo6','figuraejemplo7','fzero']

for diagram in dia:
    try:
        system('dia --export=%s.eps --filter=eps %s.dia'%(diagram,diagram))
        system('epstopdf %s.eps'%(diagram))
        system('rm %s.eps'%(diagram))
        print('*****************')
        print('diagram generated for %s'%(diagram))
        print('*****************')
    except:
        print('diagram %s failed, check that dia is installed'%(diagram))

for script in octave:
    try:
        system('octave -q %s.m'%(script))
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
try:
    system('octave -q main.m')
    system('epstopdf solucion.eps')
    system('epstopdf error.eps')
    system('epstopdf convergencia.eps')
    print('************')
    print('figuras para ejercicio espectral generadas')
    print('************')
except:
    print('figures for ejercicio espectral failed')
