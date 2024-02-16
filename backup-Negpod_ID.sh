#!/bin/bash

# Define remote server details
remote_host="64293e56bc62.3a2627c1.alu-cod.online"
remote_username="64293e56bc62"
remote_password="328d3b338a4ced526c9a"
remote_backup_location="/summative/1023-2024j"

# Backup directory name
backup_directory="negpod_id-q1"

# Copy directory to remote server
scp -r "$backup_directory" "$remote_username"@"$remote_host":"$remote_backup_location"

