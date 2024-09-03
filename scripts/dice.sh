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
  # Use awk to process the file and remove consecutive duplicates of the specific line
  awk '{
    if ($0 == "(declare-fun MaxIFuel () Fuel)" && prev == "(declare-fun MaxIFuel () Fuel)") {
      # Skip the duplicate line
      next
    }
    # Print the current line
    print
    # Update the previous line variable
    prev = $0
  }' "$file" > "$file.tmp"

  # Replace the original file with the updated content
  mv "$file.tmp" "$file"
  echo "Processed $file"
done

echo "Duplicate line removal completed."
