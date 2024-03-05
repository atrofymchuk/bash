#!/bin/bash

# Перевірка наявності аргументу командного рядка
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Перевірка наявності вхідного файлу
if [ ! -f "$input_file" ]; then
    echo "File '$input_file' not found!"
    exit 1
fi

# Створення директорії для збереження файлів
mkdir -p output_files

# Зчитування кожного рядка з вхідного файлу
while IFS= read -r line; do
    # Отримання першої літери рядка
    first_letter="${line:0:1}"

    # Створення директорії на основі першої літери, якщо вона не існує
    mkdir -p "output_files/$first_letter"

    # Запис рядка у файл у відповідну директорію
    echo "$line" > "output_files/$first_letter/$line.txt"
done < "$input_file"
