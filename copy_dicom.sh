#!/bin/bash

# Source directory (your hard drive root directory)
source_directory="/Volumes/G-DRIVE PRO/IRM_humain"

# Destination directory
destination_directory="/Volumes/PT_LAB_DATA/Data_ludo/DICOM_all_sub/"

if [ ! -d "$source_directory"]

#cp -r  "$source_directory" "$destination_directory"

# Find all DICOM subfolders and copy them to the destination directory
find "$source_directory" -type d -name "DICOM" -exec cp -R --parents {} "$destination_directory" \;
