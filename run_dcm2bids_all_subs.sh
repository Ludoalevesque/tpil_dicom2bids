#!/bin/bash

# Configuration file
config_file="/path/to/your/config_file.json"  # Replace with the actual path of your config file

# Source directory
source_directory="/Volumes/G-DRIVE PRO/IRM_humain"

# Destination directory
destination_directory="Volumes/G-DRIVE PRO/temp_ludo_dcm2bids"

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
  echo "Source directory not found."
  exit 1
fi

# Check if the destination directory exists, if not, create it
if [ ! -d "$destination_directory" ]; then
  mkdir -p "$destination_directory"
fi

# Iterate over each folder in the source directory
for folder_path in "$source_directory"/*/; do

  # Extract the folder name without the full path
  folder_name=$(basename "$folder_path")

  # Check if the subfolder "DICOM" exists in the current folder
  dicom_dir="$folder_path/DICOM"  # Define the path to the DICOM folder
  if [ ! -d "$dicom_dir" ]; then
    echo "No DICOM folder found in source folder $folder_name"
    exit 1
  fi

  # Extract the subject ID (3 digit number that follows PT_PL in foldername)
  sub_ID=$(echo "$folder_name" | grep -oE 'PT_PL[0-9]{3}' | grep -oE '[0-9]{3}')

  # Extract the session number (all the numbers that follow V in folder_name)
  session=$(echo "$folder_name" | grep -oE 'V[0-9]+')

  # Convert DICOM data to BIDS
  output_path="${destination_directory}/$session_BIDS"
  dcm2bids -d "$dicom_dir" -o "$output_path" -p "$sub_ID" -c "$config_file"

echo "Finished conversion for subject ${session}"

done

echo "Finished conversion"
