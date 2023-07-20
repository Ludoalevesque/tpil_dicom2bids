#!/bin/bash

# Source directory (your hard drive root directory)
source_directory="/path/to/source"

# Destination directory
destination_directory="/path/to/destination"

# Find all DICOM subfolders and copy them to the destination directory
find "$source_directory" -type d -name "DICOM" -exec cp -R --parents {} "$destination_directory" \;
