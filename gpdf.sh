#!/bin/bash

filename=$(basename "$1")
extension="${filename##*.}"
myBasename="${filename%.*}"
test=$myBasename".gnu"

if [ $1 != $test ]; then
    echo 'usage: gnupdf [-f fontface] [-s fontsize] [-c] figurename'
    echo 'where figurename is "myFilename.gnu"'
    exit 1
fi

gnuplot $myBasename".gnu"
fontface=times
fontsize=scriptsize
figurename=
outputname=
outputtex=
color=false

while getopts ":f:s:c" opt; do
    case $opt in
	f  ) # set font face
	    if [ $OPTARG = times ]; then
		fontface=times
	    elif [ $OPTARG = modern ]; then
		fontface=modern
	    else
		echo "unknow font face: " $OPTARG
		exit 1
	    fi
	    ;;
	s  ) # set font size
	    fontsize=$OPTARG
	    ;;
	c  ) # use color package and show all text in black
	    color=true
	    ;;
	\? )
	    echo 'usage: gnupdf [-f fontface] [-s fontsize] [-c] figurename'
	    exit 1
    esac
done
shift $(($OPTIND - 1))

if [ -z "$1" ]; then
    echo 'no figure name specified'
    echo 'usage: gnupdf [-f fontface] [-s fontsize] [-c] figurename'
    exit 1
else
    figurename=$myBasename
    outputname="c"$figurename
    outputtex="c"$figurename".tex"
fi


echo "\documentclass{article}
\usepackage{graphics}
\usepackage{amssymb}
\usepackage{t1enc}
\usepackage[utf8]{inputenc}
\usepackage{mathcomp}
\usepackage{textcomp}" > $outputtex
if [ $fontface = times ]; then
    echo "\usepackage{times}" >> $outputtex
fi
if [ $color = true ]; then
    echo "\usepackage{color}" >> $outputtex
fi

# define latex commands
echo "\newcommand{\var}{\mathrm{Var}}" >> $outputtex

echo "\begin{document}
\pagestyle{empty}
\begin{figure}" >> $outputtex
echo "\\$fontsize" >> $outputtex
echo "\input{$figurename}" >> $outputtex
echo "\end{figure}
\end{document}" >> $outputtex

if [ $color = true ]; then
    sed -i 's/white/black/g' $figurename".tex"
fi

latex $outputname
dvips $outputname".dvi"
ps2eps -f $outputname".ps"
epstopdf $outputname".eps"


echo -n "Removing "$outputname".tex"
rm $outputname.tex
echo "... done"
echo -n "Removing "$outputname".aux"
rm $outputname.aux
echo "... done"
echo -n "Removing "$outputname".log"
rm $outputname.log
echo "... done"
echo -n "Removing "$outputname".dvi"
rm $outputname.dvi
echo "... done"
echo -n "Removing "$outputname".ps"
rm $outputname.ps
echo "... done"
echo -n "Removing "$outputname".eps"
rm $outputname.eps
echo "... done"
echo -n "Removing "$figurename".tex"
rm $figurename.tex
echo "... done"
echo -n "Removing "$outputname".tex"
rm $figurename.eps
echo "... done"
