# bash---log-cleaner
## A Log Management Toolkit

A Bash automation suite designed to handle log rotation and disk space management.
## The Files

    setup_test_logs.sh: Creates a test environment with "fake" logs of various ages (1–35 days old).

    log_cleaner.sh: The main engine. Compresses logs older than 7 days into a /backups folder and deletes logs older than 30 days.

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
