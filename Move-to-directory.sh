#!/bin/bash

# Define directory name
directory_name="negpod_id-q1"

# Create directory if it doesn't exist
mkdir -p "$directory_name"

# Move all 4 files from question 1 to the directory
mv main.sh "$directory_name"
mv students-list_1023.txt "$directory_name"
mv Select-emails.sh "$directory_name"
mv student-emails.txt "$directory_name"

echo "Files moved successfully to $directory_name directory."

