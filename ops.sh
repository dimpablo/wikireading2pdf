#!/bin/bash

# Заходим в папку htms
cd htms

# Считаем все *.htm файлы в папке в переменную $num
num=$(ls -1 *.htm | wc -l)

# Создаем for-loop длиной от 1 до $num-1
for ((i=1; i<$num+1; i++))
do
  # Внутри него берем файл с названием $num и расширением htm
  file="${i}.htm"

  # Производим с ним следующую процедуру: sed '/<amp-ad/,/<\/amp-ad>/d' 1.htm > 1.htm (вместо 1.htm имя текущего файла)
  sed '/<amp-ad/,/<\/amp-ad>/d' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"

  # Затем sed -n '/<article class=/,/<\/article>/p' 1.htm > 1.htm (вместо 1.htm имя текущего файла)
  sed -n '/<article class=/,/<\/article>/p' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"

  # Затем sed 's/amp-img/img/g' 1.htm > 1.htm (вместо 1.htm имя текущего файла)
  sed 's/amp-img/img/g' "$file" > "$file.tmp"
  mv "$file.tmp" "$file"
done




echo "Temporal files created!"
cd ..
./fin.sh
