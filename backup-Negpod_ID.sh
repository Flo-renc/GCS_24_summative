#!/bin/bash

# Define remote server details
remote_host="2f05c1f8800b.3be8ebfc.alu-cod.online"
remote_username="2f05c1f8800b"
remote_password="d4a1d225d0abda9549d8"
remote_backup_location="/summative/1023-2024j"

# Backup directory name
backup_directory="negpod_id-q1"

# Copy directory to remote server
scp -r "$backup_directory" "$remote_username"@"$remote_host":"$remote_backup_location"

