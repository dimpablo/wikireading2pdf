#!/bin/bash

# Create the "htms" folder if it doesn't exist
mkdir -p htms

# Read the list file line by line
counter=1
while IFS= read -r link; do
    # Download the file using wget and rename it with an incrementing number
    wget "$link" -O "htms/$counter.htm"
    ((counter++))
done < list

./ops.sh
