import os

## Usage:
##     $> scons
##     is equivalent to:
##         $> pdflatex TeXFile
##         $> makeindex TeXFile
##     (Maybe you have to run it twice)

##     $> scons -Q clean=1
##     cleans except the pdf and the makindex files

##     $> scons -Q deepclean=1
##     cleans all

##     The script needs two variables to work
##     TeXFile: Name of the LaTeX file
##     TeX: LaTeX command:
##         It only works with pdflatex (by now...)

TeXFile='cursomo'
TeX='pdflatex'

clean = ARGUMENTS.get('clean',0)
DeepClean = ARGUMENTS.get('deepclean',0)

Files=os.listdir('.')

CleanExtensions=['.aux',
                 '.out',
                 '.lof',
                 '.ilg',
                 '.log']
DeepCleanExtensions=['.aux',
                     '.out',
                     '.lof',
                     '.ilg',
                     '.log',
                     '.idx',
                     '.ind',
                     '.toc',
                     '.pdf']


if clean:
    for File in Files:
        for Extension in CleanExtensions:
            if File.find(Extension) > 0:
                os.remove(File)

if DeepClean:
    for File in Files:
        for Extension in DeepCleanExtensions:
            if File.find(Extension) > 0:
                os.remove(File)

if not clean and not DeepClean:
    os.system(repr(TeX)+' '+repr(TeXFile))
    os.system('makeindex '+repr(TeXFile))

