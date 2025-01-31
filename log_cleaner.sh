#!/bin/bash

# Define log directory and retention period
LOG_DIR="/var/log/myapp"
RETENTION_DAYS=7

# Find and compress old log files
find "$LOG_DIR" -type f -mtime +$RETENTION_DAYS -name "*.log" -exec gzip {} \;

# Delete compressed logs older than retention period
find "$LOG_DIR" -type f -mtime +$RETENTION_DAYS -name "*.gz" -exec rm {} \;

echo "Log cleaning completed successfully!"
