#!/bin/bash

# Define directory name
directory_name="negpod_id-q1"

# Create directory if it doesn't exist
mkdir -p "$directory_name"

# Move all 4 files from question 1 to the directory
mv main.sh Students-list_1023.txt Select-emails.sh student-emails.txt "$directory_name"

