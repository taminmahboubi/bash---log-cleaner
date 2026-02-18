#!/bin/bash

# get the absolute path using 'pwd' command using 'command substitution'
SCRIPT_PATH="$(pwd)/log_cleaner.sh"


if [ ! -x "$SCRIPT_PATH" ]; then
	echo "Fixing permissions: Making log_cleaner.sh executable..."
	chmod +x "$SCRIPT_PATH"
fi

# Define the cron job (minute, hour, day of month, month, day of week)
CRON_JOB="0 0 * * 0 $SCRIPT_PATH"


# check if the job already exists to avoid duplicates
if crontab -l 2>/dev/null | grep -Fq "$SCRIPT_PATH"; then
       echo "SKIP: log cleaner is already scheduled in crontab."
else

	# append the crontab and feed it back into the system, 
	# '2>/dev/null' to avoid the 'no crontab for user' error for first time users
	
	(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab - 
	echo "SUCCESS: Log cleaner scheduled for every Sunday at midnight!"
fi

