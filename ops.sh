#!/bin/bash


cd htms

# Count all *.htm and save in $num
num=$(ls -1 *.htm | wc -l)

for ((i=1; i<$num+1; i++))
do
  # take a file
  file="${i}.htm"

  # remove Ads
  sed '/<amp-ad/,/<\/amp-ad>/d' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"

  # Remove unnecessary junk
  sed -n '/<article class=/,/<\/article>/p' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"

  # Correct images
  sed 's/amp-img/img/g' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"
done




echo "Temporal files created!"
cd ..
./fin.sh
