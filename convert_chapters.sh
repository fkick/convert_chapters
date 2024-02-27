#!/bin/bash

#Script to scan a media file's MediaInfo text input to identify Chapters and export that chapter information to an MKVToolnix compatible chapter file.

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_mediainfo_file output_chapters_file"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -e "$input_file" ]; then
    echo "Error: Input file not found: $input_file"
    exit 1
fi

# Extract chapter information from the "Menu" section using awk
awk '/^Menu$/,/^$/' "$input_file" | grep -E "^[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3} " | awk -F'en:' '{gsub(/[ \t]+$/, "", $1); gsub(/[:]+$/, "", $1); gsub(/[ \t]+$/, "", $2); print "CHAPTER"NR"="$1"\nCHAPTER"NR"NAME="$2}' > "$output_file"

echo "Chapters extracted and saved to $output_file"
