#!/bin/bash

# Generates PSTricks Graphics (*.eps, *.png, *.pdf)
# from given *.tex file

filename=${1%%.*}

latex $filename.tex

dvips $filename.dvi -E -o $filename.eps
convert -density 300 $filename.eps $filename.png
epstopdf $filename.eps $filename.pdf
