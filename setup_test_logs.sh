#!/bin/bash

# defined the test directory
TEST_DIR="./test_logs"
days=5

# ANSI CODES
RESET="\033[0m"
BOLD="\033[1m"
ITALIC="\033[3m"
GREEN="\033[32m"

echo -e "Setting up testing environment in:${BOLD} [$TEST_DIR]${RESET}"

# Create the directory if one doesn't exit '-p' flag
mkdir -p "$TEST_DIR"

# Create a 'current' log (0 days old)
touch "$TEST_DIR/current_app.log"

# Create older logs
for val in {1..10}; do
	days=$(( days + 5 ))
	touch -d "$days days ago" "$TEST_DIR/old_app_v$val.log"
done

echo -e "Done! Run '${GREEN}ls -l $TEST_DIR${RESET}' to see the file dates."

