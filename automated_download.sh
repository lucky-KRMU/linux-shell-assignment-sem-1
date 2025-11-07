#!/bin/bash

# --- Configuration ---
# 1. Variable for the URL of the file to download
DOWNLOAD_URL="http://example.com/somefile.txt" # !! CHANGE THIS to the actual file URL !! 

# 2. Variable for the target directory to save the file
TARGET_DIR="/home/user/downloads/web_files" # !! CHANGE THIS to your desired download folder !! 

# 3. Extract the filename from the URL for easier reference
FILENAME=$(basename "$DOWNLOAD_URL") 

# --- Main Logic ---

echo "Starting download of '$FILENAME'..."

# Create the target directory if it does not exist
mkdir -p "$TARGET_DIR" 

# Change directory to the target location
cd "$TARGET_DIR" 

# Check if wget is installed
if ! command -v wget &> /dev/null
then
    echo "Error: wget could not be found. Please install it." 
    exit 1
fi

# Use wget to download the file. 
# -q makes it quiet (less output), but still shows errors.
wget -q "$DOWNLOAD_URL" [cite: 45, 50]

# Check the exit status of the wget command
if [ $? -eq 0 ]; then
    echo "Download completed successfully."
    echo "File saved as: $TARGET_DIR/$FILENAME"
else
    echo "Error: Download failed or URL is invalid."
fi

# Change back to the home directory for good practice
cd - > /dev/null 2>&1