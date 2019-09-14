#!/bin/bash

# Generates *.pdf
# and an *.html version with equations as graphics (*.png)
# from given *.tex file

filename=${1%%.*}

pdflatex $filename.tex

pandoc -s --gladtex $filename.tex -o $filename.htex
gladtex -d $filename $filename.htex
