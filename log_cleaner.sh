#!/bin/bash

# Define log directory and retention period
LOG_DIR="/var/log/myapp"
RETENTION_DAYS=7

# Make sure the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory $LOG_DIR does not exist!"
    exit 1
fi


# Find and compress old log files
find "$LOG_DIR" -type f -mtime +$RETENTION_DAYS -name "*.log" -exec gzip {} \;

# Delete compressed logs older than retention period
find "$LOG_DIR" -type f -mtime +$RETENTION_DAYS -name "*.gz" -exec rm {} \;

echo "Log cleaning completed successfully!"
