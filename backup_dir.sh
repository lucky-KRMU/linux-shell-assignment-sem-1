#!/bin/bash

# Script: backup_dir.sh
# Purpose: Copies a specified source directory to a designated backup location, appending a timestamp to the backup folder name for unique identification.
# Author: Lucky Pawar 
# Date: 2025-11-07


# --- Configuration ---
# 1. Variable for the directory to be backed up
SOURCE_DIR="D:\KRMU\Sem-1\CSFCP\Assignments\A-2\Solutions\Code\proj_files" 

# 2. Variable for the main backup location
BACKUP_ROOT_DIR="D:\KRMU\Sem-1\CSFCP\Assignments\A-2\Solutions\Code\Backup" 

# 3. Create a timestamp in YYYY-MM-DD-HHMMSS format
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S) 

# 4. Construct the full path for the new backup folder
BACKUP_DIR_NAME="project_backup_$TIMESTAMP" 
FULL_BACKUP_PATH="$BACKUP_ROOT_DIR/$BACKUP_DIR_NAME" 

# --- Main Logic ---

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist." 
    exit 1
fi

# Create the root backup directory if it doesn't exist
mkdir -p "$BACKUP_ROOT_DIR" 

echo "Starting backup of '$SOURCE_DIR' to '$FULL_BACKUP_PATH'..."

# Use 'cp -r' to recursively copy the source directory contents to the new timestamped folder
cp -r "$SOURCE_DIR" "$FULL_BACKUP_PATH" 

# Check the exit status of the copy command
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    echo "Backup stored at: $FULL_BACKUP_PATH"
else
    echo "Error: Backup failed."
fi