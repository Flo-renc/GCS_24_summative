#!/bin/bash

#back of directory

# Configuration
# Details about remote server
SOURCE_DIR="Negpod_24-q1"
DEST_HOST="64293e56bc62.3a2627c1.alu-cod.online"
DEST_USER="64293e56bc62"
DEST_DIR="/summative/1023-2024j"
PASSWORD="328d3b338a4ced526c9a"

#create a backup directory and copy it on the remote server
sshpass -p "$PASSWORD" scp -o StrictHostKeyChecking=no -r "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR"

if [ $? -ne 0 ]; then
  echo "Failed to copy directory"
  exit 1
else 
  echo "Directory copied successfully"
fi


