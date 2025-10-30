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
	echo "**********"
	echo "Copying pdf files to website git project ..."
	cp *.pdf  ../assets/pdf/
fi


# convert bib to html 

echo "Converting bib file to prepare for web site"

sed 's/\\textsuperscript{\([^}]*\)}/<sup>\1<\/sup>/g' "iana-all.bib" > "iana-all-html.bib"

echo "Copynig bib file to web site folder"

cp iana-all-html.bib  ../_bibliography/

echo "Done"