PY := $(wildcard *.py)
LYX := $(wildcard *.lyx)
TEX := $(wildcard *.tex)


all: pdf 

pdf: fig
	@echo *************************************
	@echo Contstruyendo documentos desde $(LYX)
	@echo *************************************
	lyx --export pdf $(LYX)

fig:
	@echo ********************************
	@echo Construyendo figuras desde $(PY)
	@echo ********************************
	python $(PY)




