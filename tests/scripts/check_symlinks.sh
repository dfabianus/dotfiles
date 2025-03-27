#!/bin/bash

# Function to check if a symlink exists and points to the correct location
check_symlink() {
    local target=$1
    local source=$2
    
    if [ ! -L "$target" ]; then
        echo "❌ $target is not a symlink"
        return 1
    fi
    
    local real_source=$(readlink -f "$target")
    local expected_source=$(readlink -f "$source")
    
    if [ "$real_source" = "$expected_source" ]; then
        echo "✅ $target -> $source"
        return 0
    else
        echo "❌ $target points to wrong location"
        echo "   Expected: $expected_source"
        echo "   Got: $real_source"
        return 1
    fi
}

# Test cases
echo "Testing symlinks..."
echo "------------------"

# Test bashrc
check_symlink "$HOME/.bashrc" "$HOME/dotfiles/.bashrc"

# Test mcp.json
check_symlink "$HOME/.cursor/mcp.json" "$HOME/dotfiles/.cursor/mcp.json"

# Add more test cases as needed 