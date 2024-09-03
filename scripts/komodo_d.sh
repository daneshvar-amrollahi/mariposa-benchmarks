#!/bin/bash

# Check if directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the provided argument is a valid directory
if [ ! -d "$1" ]; then
  echo "Error: $1 is not a valid directory."
  exit 1
fi

# Find all .smt2 files recursively in the specified directory and its subdirectories
find "$1" -type f -name "*.smt2" | while read -r file; do
  # Use sed to replace all occurrences of 'bv2int' with 'bv2nat' in-place
  sed -i 's/bv2int/bv2nat/g' "$file"
  echo "Processed $file"
done

echo "Replacement completed."
