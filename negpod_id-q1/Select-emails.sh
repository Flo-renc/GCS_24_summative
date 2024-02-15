#!/bin/bash
## Select just the emails of the students.
cut -d ',' -f 1 Students-list_1023.txt > student-emails.txt
echo "Emails selected and saved in student-emails.txt."
