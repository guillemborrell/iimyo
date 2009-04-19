#!/bin/bash

gs -q -dNOPAUSE -dBATCH -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOutputFile=cursomo_embed.pdf cursomo.pdf
