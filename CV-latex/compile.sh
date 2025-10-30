#!/bin/bash

latexmk -pdf -silent CV_Iana_Atanassova_fr.tex
latexmk -pdf -silent CV_Iana_Atanassova_fr.tex

latexmk -pdf -silent CV_Iana_Atanassova_en.tex
latexmk -pdf -silent CV_Iana_Atanassova_en.tex

latexmk -c

# SHOW ERROR MESSAGES :

# warnings : 

woutput=$(grep -i -n -C 1 "warning: " *.log)

if [ -n "$woutput" ]; then
	echo "WARNINGS :"
	echo "-----"
  	echo "$woutput"
  	echo "-----"
fi

# errors : 

eoutput=$(grep -i -n -C 4 "^! " *.log)

if [ -n "$eoutput" ]; then
	echo "ERRORS :"
	echo "====="
  	echo "$eoutput"
  	echo "====="
else 
	echo "No errors detected!"
	echo "Copying files to website git project ..."
	cp *.pdf  ../assets/pdf/
fi
