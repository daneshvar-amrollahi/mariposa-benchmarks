#!/bin/bash

# Check if directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Directory to search
directory="$1"

# Starting message
echo "Starting cleanup in directory: $directory"

# Find and process .smt2 files
find "$directory" -type f -name "*.smt2" | while read -r file; do
  # Log the file being processed
  echo "Processing file: $file"
  
  # Remove lines with "(push)" and make changes in-place
  sed -i '/(push)/d' "$file"
  
  echo "Removed lines containing '(push)' in file: $file"
done

# Completion message
echo "Cleanup completed. All files processed."
