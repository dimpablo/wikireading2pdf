#!/bin/bash

# Проверяем, что передан аргумент командной строки
if [ -z "$1" ]; then
    echo "NO URL FOUND!"
    exit 1
fi

# Скачиваем файл с помощью wget
wget "$1" -O tmp.htm

# Проверяем, была ли ошибка при скачивании
if [ $? -ne 0 ]; then
    echo "Invalid URL!"
    exit 1
fi

# Используем sed для сохранения символов между строками '<aside id=' и '</nav></aside>' в тот же файл tmp.htm
sed -n '/<aside id=/,/<\/nav><\/aside>/p' tmp.htm > tmp2.htm
mv tmp2.htm tmp.htm

# Используем sed для поиска строк, заключенных между '<a href="' и '"' и сохраняем их в файл newlist.txt
sed -n 's/.*<a href="\([^"]*\)".*/\1/p' tmp.htm > list

# Удаляем временный файл
rm tmp.htm

echo "Links are extracted!"
./downloader.sh
