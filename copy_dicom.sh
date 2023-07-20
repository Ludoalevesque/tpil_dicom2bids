#!/bin/bash

# Source directory (your hard drive root directory)
source_directory="/Volumes/G-DRIVE PRO/IRM_humain"

# Destination directory
destination_directory="/Volumes/PT_LAB_DATA/Data_ludo/DICOM_all_sub/"


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
  if [ -d "$folder_path/DICOM" ]; then
    # Create a new folder with the same name in the destination directory
    new_folder_path="$destination_directory/$folder_name"
    mkdir -p "$new_folder_path"

    # Copy the subfolder "DICOM" to the new folder in the destination directory
    cp -r "$folder_path/DICOM" "$new_folder_path/"
    echo "Copied DICOM folder from $folder_name to $new_folder_path"
  else
    echo "No DICOM folder found in $folder_name"
  fi
done

echo "Finished copying DICOM folders."
