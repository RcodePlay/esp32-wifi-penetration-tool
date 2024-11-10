#!/bin/bash

# Check if filename argument is provided
if [ -z "$1" ]; then
    echo "Missing argument - filename!"
    exit 1
fi

# Remove ".html" from the filename to generate the output filename
output_name=$(echo "$1" | sed 's/.html$//')  # Add $ to ensure it only removes ".html" at the end
output_filename="page_${output_name}.h"

# Write the initial header to the output file
echo "#ifndef PAGE_${output_name^^}_H
#define PAGE_${output_name^^}_H

// This file was generated using xxd" > "$output_filename"

# Gzip the file and write it to the static array
gzip --best "$1" -c > "page_${output_name}.gz"  # Save as a .gz file for consistency
xxd -i -u "page_${output_name}.gz" >> "$output_filename"
rm "page_${output_name}.gz"

# Append the closing header to the output file
echo -e "\n#endif" >> "$output_filename"

# Move the output file to the target directory
pages_location="../pages"
echo "Moving $output_filename to $pages_location/$output_filename"
mv "$output_filename" "$pages_location/$output_filename"
