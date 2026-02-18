#!/bin/bash

# Define log directory and retention period
LOG_DIR="${1:-./test_logs}"
RETENTION_DAYS=7
STATUS_LOG="./cleaner_activity.log"

# create a directory to store the backups .gz files 
BACKUP_DIR="$LOG_DIR/backups"
mkdir -p  "$BACKUP_DIR"

touch "$STATUS_LOG"

log_message() {
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$STATUS_LOG"
}

# Make sure the directory exists
if [ ! -d "$LOG_DIR" ]; then
	msg="ERROR: Log directory $LOG_DIR does not exist!"
	echo "$msg"
	log_message "$msg"
       	exit 1
fi


# Find and compress old log files (maxdepth 1: only in the main folder)
find "$LOG_DIR" -maxdepth 1 -type f -name "*.log" -mtime +7  -exec gzip {} \;

# move the zipped files to the backup folder
mv "$LOG_DIR"/*.gz "$BACKUP_DIR/" 2>/dev/null
bckupmsg="SUCCESS: Logs between [7-30] days compressed and moved to $BACKUP_DIR"
log_message "$bckupmsg"
echo "$bckupmsg"

# Delete compressed logs older than retention period
find "$BACKUP_DIR" -type f -name "*.gz" -mtime +30 -delete
msg="SUCCESS: Logs older than 30 days purged from $BACKUP_DIR"
log_message "$msg"
echo "$msg"
