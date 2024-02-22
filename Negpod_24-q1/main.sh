#!/bin/bash

'# Function to create a student record
create_student_record() {
    # Prompt user for student details
    read -p "Enter student email: " email
    read -p "Enter student age: " age
    read -p "Enter student ID: " student_id

    # Save student record to file
    echo "$email, $age, $student_id" >> Students-list_1023.txt
}

# "Function to save student record to file
save_student_record() {
    # Write student record to file
    echo "$1" >> Students-list_1023.txt
}

# Function to view all students
view_all_students() {
    # Display contents of Students-list_1023.txt
    cat Students-list_1023.txt
}

# Function to delete a student record
delete_student_record() {
    # Prompt user for student ID to delete
    read -p "Enter student ID to delete: " student_id
    # Delete student record from file
    sed -i "/^$student_id/d" Students-list_1023.txt
}

# Function to update a student record
update_student_record() {
    # Prompt user for student ID to update
    read -p "Enter student ID to update: " student_id
    # Prompt user for new student details
    read -p "Enter new student email: " new_email
    read -p "Enter new student age: " new_age
    # Update student record in file
    sed -i "s/^$student_id,.*/$new_email, $new_age, $student_id/" Students-list_1023.txt
}

# Main menu loop
while true; do
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_student_record ;;
        2) view_all_students ;;
        3) delete_student_record ;;
        4) update_student_record ;;
        5) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done'
STUDENTS_FILE="students-list_1023.txt"

while true; do
    echo
    echo "Student Management System"
    echo "-------------------------"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Enter your choice (1-5): " choice
    echo

    case $choice in
        1)  # Create student record
            read -p "Enter student email: " email
            read -p "Enter student age: " age
            read -p "Enter student ID: " student_id

            # Check for existing records with the same email or student ID
            if grep -E "^$email\s|\s$student_id$" "$STUDENTS_FILE" > /dev/null; then
                echo "Student record with the same email or student ID already exists. Cannot create duplicate records."
            else
                echo "$email $age $student_id" >> "$STUDENTS_FILE"
                echo "Student record created and saved."
            fi
            ;;

        2)  # View all students
            if [ -s "$STUDENTS_FILE" ]; then
		echo "list"
		echo "---------"
                cat "$STUDENTS_FILE"
                echo  # Empty line for separation
            else
                echo "No students found."
            fi
            ;;

        3)  # Delete student record
            read -p "Enter student ID to delete: " delete_id

	    if grep -wq "$delete_id" "$STUDENTS_FILE"; then
            awk -v id="$delete_id" '$3 != id' "$STUDENTS_FILE" > tmpfile && mv tmpfile "$STUDENTS_FILE"
            echo
	    echo "Student record with ID $delete_id deleted."
    else
	    echo
	    echo "Student record with ID $delete_id is not found"
	    fi
	    ;;

        4)  # Update student record
            read -p "Enter student ID to update: " update_id

	    if grep -wq "$update_id" "$STUDENTS_FILE"; then
            read -p "Enter new email: " new_email
            read -p "Enter new age: " new_age

            # Update the entire line

             awk -v id="$update_id" -v email="$new_email" -v age="$new_age" '{if ($3 == id) print email, age, id; else print}' "$STUDENTS_FILE" > tmpfile && mv tmpfile "$STUDENTS_FILE"
            echo "Student record with ID $update_id updated."
    else
	    echo
	    echo "Student record with ID $update_id is not found"
	    fi
            ;;

        5)  # Exit the application
            echo "Exiting the application."
            exit 0
            ;;

        *)  # Invalid choice
            echo "Invalid choice. Please enter a number between 1 and 5."
            ;;
    esac
done
