#!/bin/bash
## Select just the emails of the students.
awk -F ', ' '{print $1}' students-list_1023.txt > student-emails.txt
echo "Emails selected and saved in student-emails.txt."
