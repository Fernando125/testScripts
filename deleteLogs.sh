#!/bin/bash

# Directory where we can see the logs
directory="/var/log/journal"
# Variable to keep the date of the day in the format "01012000"
dateLogs=$(date +'%d%m%Y')

rename_logs() {
    # Loop for rename all logs files
    for file in "$directory"/*; do
        # Get filename
        filename=$(basename "$file")
        filename_noext="${filename%.*}"

        # New renamed filename
        new_filename="${filename_noext}-1.log"

        # Verify if file has been renamed
        if [ "$filename" != "$new_filename" ]; then
            # Rename files with cp command
            cp "$file" "$directory/$new_filename"
        fi
    done
}

# Find and delete log older than 7 days
find "$directory" -type f -mtime +7 -exec rm {} \;

# Find all log files older than 7 days, duplicate and rename them
rename_logs

#Zip only duplicated files
find "$directory" -type f -name "*-1*" -exec zip -q logs_$dateLogs.zip {} +

#Delete duplicated files with "-1" string
find "$directory" -type f -name "*-1*" -exec rm {} \;

echo "Logs files less than 7 days have been compressed and logs files older than 7 days have been deleted"