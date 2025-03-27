#!/bin/bash

# Function to check if a bash script is valid
validate_bash_script() {
    local file=$1
    echo "Validating $file..."
    
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "❌ File not found: $file"
        return 1
    fi
    
    # Check syntax
    if bash -n "$file" 2>/dev/null; then
        echo "✅ Syntax check passed"
    else
        echo "❌ Syntax check failed"
        return 1
    fi
    
    # Check for common issues
    if grep -q "set -e" "$file"; then
        echo "✅ Has error handling (set -e)"
    else
        echo "⚠️  No error handling found (set -e)"
    fi
    
    if grep -q "set -u" "$file"; then
        echo "✅ Has unbound variable checking (set -u)"
    else
        echo "⚠️  No unbound variable checking (set -u)"
    fi
    
    return 0
}

# Test cases
echo "Validating bash configurations..."
echo "--------------------------------"

# Test bashrc
validate_bash_script "$HOME/.config/bash/bashrc"

# Add more test cases as needed 