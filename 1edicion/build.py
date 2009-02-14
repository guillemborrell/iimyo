# -*- coding: utf-8 -*-

import os
import sys

files=os.listdir('.')
clean_ext='.out .lof .ilg .log'.split()
deepc_ext='.aux .out .lof .ilg .log .idx .ind .toc .pdf'.split()

def clean():
    for file in files:
        if file in clean_ext:
            os.remove(file)

def deepclean():
    for file in files:
        if file in clean_ext:
            os.remove(file)

def build():
    os.chdir('figuras')
    os.system('python generatefigs.py')
    os.chdir(os.pardir)
    os.system('pdflatex cursomo.tex')
    os.system('makeindex cursomo.tex')


if os.name == 'posix':

    if 'clean' in sys.argv:
        clean()
    
    elif 'deepclean' in sys.argv:
        deepclean()

    elif 'build' in sys.argv:
        build()

    else:
        print """Utiliza los comandos build, clean o deepclean
Deberías haber leído el archivo LEEME, que se llama así por algo.
"""

if os.name == 'nt':
    from Tkinter import *

    class App(object):
        def __init__(self, master):
            frame = Frame(master)
            frame.pack()

            self.text = Label(frame,
                              text = 
                              u"Introducción Informal a Matlab y Octave")
            self.text.pack(side=TOP)
            
            self.button = Button(frame,
                                 text="SALIR",
                                 fg="red",
                                 command=frame.quit)
            
            self.button.pack(side=LEFT)
            
            self.build = Button(frame,
                                text="Generar",
                                command=build)
            self.build.pack(side=LEFT)

            self.clean = Button(frame,
                                text="Limpiar",
                                command=clean)
            self.clean.pack(side=LEFT)
            
            self.deepclean = Button(frame,
                                    text="Limpiar todo",
                                    command=deepclean)
            self.deepclean.pack(side=LEFT)


    root = Tk()
    app = App(root)
    root.mainloop()
