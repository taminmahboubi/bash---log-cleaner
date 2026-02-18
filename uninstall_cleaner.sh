#!/bin/bash

SCRIPT_NAME="log_cleaner.sh"

# check if its actually in the crontab before running
if crontab -l 2>/dev/null | grep -Fq "$SCRIPT_NAME"; then
	# remove only the line containing the script
	crontab -l | grep -v "$SCRIPT_NAME" | crontab -
	echo "SUCCESS: Log cleaner has been removed from your schedule"
else
	echo "SKIP: No scheduled task for $SCRIPT_NAME was found!"
fi

