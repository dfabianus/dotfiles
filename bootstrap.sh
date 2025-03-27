#!/bin/bash

# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    echo -e "${2}${1}${NC}"
}

# Check if git is installed
if ! command -v git >/dev/null 2>&1; then
    print_message "Git is not installed. Please install git first." "$RED"
    exit 1
fi

# Initialize dotbot if not already initialized
if [ ! -d "dotbot" ]; then
    print_message "Initializing dotbot..." "$YELLOW"
    git submodule add https://github.com/anishathalye/dotbot
    git submodule update --init --recursive
fi

# Run dotbot
print_message "Running dotbot..." "$YELLOW"
./dotbot/dotbot -d . -c config/dotbot/install.conf.yaml

print_message "Bootstrap completed successfully!" "$GREEN" 