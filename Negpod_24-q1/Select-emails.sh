#!/bin/bash

# Extract emails from students-list_1023.txt and save them to student-emails.txt
grep -oE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b' students-list_1023.txt > student-emails.txt

echo "Emails of students saved to student-emails.txt"


