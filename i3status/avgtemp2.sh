#!/bin/bash

# Set the paths to the input files
file1="/path/to/file1.txt"
file2="/path/to/file2.txt"
file3="/path/to/file3.txt"
file4="/path/to/file4.txt"

# Set the output file for the average value
output_file="/path/to/output_file.txt"

# Function to calculate the average value
calculate_average_value() {
  local sum=0
  local count=0

  for file in "$@"; do
    if [ -f "$file" ]; then
      local value=$(cat "$file")
      sum=$(bc <<< "$sum + $value")
      count=$(($count + 1))
    fi
  done

  if [ $count -gt 0 ]; then
    local average=$(bc <<< "scale=2; $sum / $count")
    echo $average
  else
    echo 0
  fi
}

# Loop to continuously update the output file
while true; do
  average_value=$(calculate_average_value "$file1" "$file2" "$file3" "$file4")
  mkdir -p "$(dirname "$output_file")"
  echo "$(date +"%F %T"): $average_value" > "$output_file"
  sleep 1
done

