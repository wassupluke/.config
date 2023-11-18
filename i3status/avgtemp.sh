#!/bin/bash

# Set the path to the hwmon directory
hwmon_dir="/sys/class/hwmon/hwmon6"

# Set the prefix for the CPU temperature files
temp_prefix="temp"

# Set the suffix for the CPU temperature files
temp_suffix="_input"

# Set the output file for the averaged temperature
output_file="/home/wassu/.config/i3status/temp.txt"

# Function to calculate the average temperature
calculate_average_temperature() {
  local sum=0
  local count=0

  for core in $(ls $hwmon_dir); do
    if [ -f "$hwmon_dir/$core/$temp_prefix$temp_suffix" ]; then
      local temp=$(cat "$hwmon_dir/$core/$temp_prefix$temp_suffix")
      sum=$(($sum + $temp))
      count=$(($count + 1))
    fi
  done

  if [ $count -gt 0 ]; then
    local average=$(($sum / $count))
    echo $average
  else
    echo 0
  fi
}

# Loop to continuously update the output file
while true; do
  average_temperature=$(calculate_average_temperature)
  mkdir -p "$(dirname "$output_file")"
  echo "$average_temperature°C" > "$output_file"
  sleep 1
done

