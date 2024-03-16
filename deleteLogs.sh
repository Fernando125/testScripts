#!/bin/bash

# Directory where we can see the logs
directory="/home/fernando/pruebas"
# Variable to keep the date of the day in the format "01012024"
dateLogs=$(date +'%d%m%Y')

rename_logs() {
    # Loop for rename all logs files
    for file in "$directory"/*; do
        # Get filename
        filename=$(basename "$file")
        filename_noext="${filename%.*}"

        # New renamed filename
        new_filename="${filename_noext}-1.log"
    done
}

# Find and delete log older than 7 days
find "$directory" -type f -mtime +7 -exec rm {} \;

# Find all log fields older than 7 days, duplicate and rename them

rename_logs

# Finds "*.log" files less than 7 days old and compresses them into .zip
find "$directory" -type f -name "*.log" -ctime -7 -exec zip -q logs_$dateLogs.zip *.log \;

# Logs that have been compressed are eliminated so that there is no duplicate information
find "$directory" -type f -name "*.log" -ctime -7 -exec rm {} \;

echo "Logs files less than 7 days have been compressed and logs files older than 7 days have been deleted"