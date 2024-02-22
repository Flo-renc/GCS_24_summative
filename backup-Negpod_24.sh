#!/bin/bash

# Variables for remote server details
HOST="64293e56bc62.3a2627c1.alu-cod.online"
USERNAME="64293e56bc62"
PASSWORD="328d3b338a4ced526c9a"
REMOTE_DIR="/summative/1023-2024j"
LOCAL_DIR="Negpod_24-q1" # Directory to be backed up

# Use rsync to backup the directory to the remote server
rsync -avz -e "sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no" "$LOCAL_DIR" "$USERNAME@$HOST:$REMOTE_DIR"

echo "Backup completed successfully."

