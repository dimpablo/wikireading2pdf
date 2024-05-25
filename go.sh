#!/bin/bash

# Check argc
if [ -z "$1" ]; then
    echo "NO URL FOUND!"
    exit 1
fi

# Download file to extract chapters
wget "$1" -O tmp.htm

# Catch mistakes
if [ $? -ne 0 ]; then
    echo "Invalid URL!"
    exit 1
fi

# extract list of chapters
sed -n '/<aside id=/,/<\/nav><\/aside>/p' tmp.htm > tmp2.htm
mv tmp2.htm tmp.htm

# Seek for hrefs 
sed -n 's/.*<a href="\([^"]*\)".*/\1/p' tmp.htm > list

# Удаляем временный файл
rm tmp.htm

echo "Links are extracted!"
./downloader.sh
