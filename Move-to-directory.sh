#!/bin/bash

#create directory and move files to directory

destination_dir="Negpod_24-q1"

mkdir -p "$destination_dir"

mv main.sh Students-list_1023.txt Select-emails.sh student-emails.txt "$destination_dir/"

