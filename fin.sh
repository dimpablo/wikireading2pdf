#!/bin/bash

echo "Postprocessing files:"
echo "...merging pages..."
cat $(ls -v ./htms/*.htm) > merged.htm
echo "Done" # HTML CREATED


echo "...Setting encoding..."
sed -i '1i<html style="background-color: white;"><meta charset="utf-8">' merged.htm
echo "...Preparing PDF..."
wkhtmltopdf merged.htm RESULT.pdf
echo "Done" # PDF CREATED

echo "...Preparing FB2 (may take a long time)..."
pandoc -s -f html -t fb2 merged.htm -o RESULT.fb2  
echo "Done" # FB2 CREATED
rm -r htms
rm merged.htm
rm list
echo "Success!"
