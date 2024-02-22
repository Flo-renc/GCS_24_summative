#!/usr/bin/env bash
# Backing up our directory on another server

# Define the remote server
remote_server="64293e56bc62.3a2627c1.alu-cod.online"
remote_dir="/summative/1023-2024j/"

# Source Directory
source_dir="Negpod_24-q1"

# Backup Directory
backup_dir="backup-Negpod_24-q1"

# Create backup directory
mkdir "$backup_dir"

# Check if directory creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create backup directory"
    exit 1
fi

# Copy content of source_dir to backup_dir
cp -r "$source_dir" "$backup_dir"

# Check if copy was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy directory content"
    exit 1
fi

# Transfer backup to the remote server
scp -r "$backup_dir" "$remote_server:$remote_dir"

# Check if transfer was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to transfer backup to remote server"
    exit 1
fi

# Remove the backup from our sandbox
rm -r "$backup_dir"

# Check if removal was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to remove backup directory"
    exit 1
fi

echo "Directory backed up successfully"
