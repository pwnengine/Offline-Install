#!/bin/bash

# Exit on any error
set -e

# Find all .tar.gz files in the current directory
for tar_file in *.tar.gz; do
    if [ -f "$tar_file" ]; then
        echo "Extracting $tar_file..."
        # Extract the tar.gz file
        tar -xvzf "$tar_file"
        # Get the directory name created by extraction (assumes tar extracts to a single folder)
        dir_name=$(tar -tzf "$tar_file" | head -1 | cut -f1 -d"/")
        if [ -d "$dir_name" ]; then
            echo "Checking directory $dir_name for .deb files..."
            cd "$dir_name"
            # Check for .deb files in the current directory
            for deb_file in *.deb; do
                if [ -f "$deb_file" ]; then
                    echo "Installing $deb_file..."
                    # Install the .deb file using apt
                    sudo apt install "./$deb_file" -y
                else
                    echo "No .deb files found in $dir_name."
                fi
            done
            # Return to the original directory
            cd ..
            # Delete the extracted directory
            echo "Deleting directory $dir_name..."
            rm -rf "$dir_name"
        else
            echo "No directory created from $tar_file; skipping."
        fi
    else
        echo "No .tar.gz files found in the current directory."
        exit 1
    fi
done

echo "All .tar.gz files processed, .deb files installed, and extracted directories deleted."
