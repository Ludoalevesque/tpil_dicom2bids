#!/bin/bash

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
  if [  ! -d "$dicom_dir" ]; then
    echo "No DICOM folder found in source folder $folder_name"
    exit 1
  fi

  # Extract the subject ID (3 digit number that follows PT_PL in foldername)
  sub_ID=

  # Extract the session number (all the numbers that follow V in folder_name)
  session=

  # Convert DICOM data to BIDS

  output_path="${destination_directory}/V${session}_BIDS"

  dcm2bids -d "$dicom_dir" -o "$destination_directory" -p "$sub_ID"

echo "Finished copying DICOM folders."
