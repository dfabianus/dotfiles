#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to run a test and report its status
run_test() {
    local test_name=$1
    local test_script=$2
    
    echo -e "\n${YELLOW}Running $test_name...${NC}"
    if bash "$test_script"; then
        echo -e "${GREEN}✓ $test_name passed${NC}"
    else
        echo -e "${RED}✗ $test_name failed${NC}"
    fi
}

# Make all test scripts executable
chmod +x tests/scripts/*.sh
chmod +x tests/validation/*.sh

# Run all tests
echo "Starting dotfiles tests..."
echo "========================"

# Run symlink tests
run_test "Symlink Tests" "tests/scripts/check_symlinks.sh"

# Run validation tests
run_test "Bash Validation" "tests/validation/validate_bash.sh"
run_test "JSON Validation" "tests/validation/validate_json.sh"

# Add more test categories as needed

echo -e "\n${YELLOW}All tests completed${NC}" 