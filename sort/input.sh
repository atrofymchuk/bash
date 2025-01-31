#!/bin/bash

# Here we check if the argument of comand line exist
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Cheking if input file exist
if [ ! -f "$input_file" ]; then
    echo "File '$input_file' not found!"
    exit 1
fi

# Creating the directory for saving files
mkdir -p output_files

# Reading each line from input file
while IFS= read -r line; do
    # Getting the first letter of line
    first_letter="${line:0:1}"

    # Creating folder based on first letter, if the one doesn't exist
    mkdir -p "output_files/$first_letter"

    # Writing line to file to the proper folder
    echo "$line" > "output_files/$first_letter/$line.txt"
done < "$input_file"
