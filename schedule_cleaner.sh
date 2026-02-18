#!/bin/bash

# get the absolute path using 'pwd' command using 'command substitution'
SCRIPT_PATH="$(pwd)/log_cleaner.sh"

# make sure the log cleaner is executable
chmod +x "$SCRIPT_PATH"

# Define the cron job (minute, hour, day of month, month, day of week)
CRON_JOB="0 0 * * 0 $SCRIPT_PATH"

# append the crontab and feed it back into the system, 
# '2>/dev/null' to avoid the 'no crontab for user' error for first time users
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab - 
echo "SUCCESS: Log cleaner scheduled for every Sunday at midnight!"
