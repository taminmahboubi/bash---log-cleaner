# bash---log-cleaner
## A Log Management Toolkit

A Bash automation suite designed to handle log rotation and disk space management, as well as automation.
## The Files
    
    setup_test_logs.sh: Creates a dummy directory and populates it with "old" and "new" logs for testing.

    log_cleaner.sh: The core engine. It zips logs older than 7 days and deletes backups older than 30 days.

    schedule_cleaner.sh: The installer. It checks permissions and schedules the cleaner to run every Sunday at Midnight via Cron.

    uninstall_cleaner.sh: The uninstaller. Safely removes the scheduled task without touching your other cron jobs.
    
    cleaner_activity.log: The audit trail that records every successful cleanup with a timestamp.
    
## How to Run:

Follow these steps in order to see the automation in action:

    Prepare the environment:
    ./setup_test_logs.sh
    (Creates the ./test_logs folder with sample files)

    Run the cleaner:
    ./log_cleaner.sh
    (Processes the files based on their age)

    Verify the results:
    ls -R test_logs/
    (You will see the new /backups folder with compressed .gz files)

    Check the logs:
    grep "SUCCESS" cleaner_activity.log
    
    (Automation)
    Enable Automation:
    chmod +x schedule_cleaner.sh && ./schedule_cleaner.sh

    Remove Automation:
    chmod +x uninstall_cleaner.sh && ./uninstall_cleaner.sh
