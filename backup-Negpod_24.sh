#!/bin/bash

# Remote server details
REMOTE_USER="85c43418188e"
REMOTE_HOST="85c43418188e.70681577.alu-cod.online"
REMOTE_DIR="/summative/1023-2024"

# Directory to be backed up
LOCAL_DIR="Negpod_24-q1"

# Perform backup
rsync -avz --delete $LOCAL_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "Backup successful."
else
    echo "Backup failed. Please check the logs."
fi
