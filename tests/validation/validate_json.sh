#!/bin/bash

# Function to check if a JSON file is valid
validate_json_file() {
    local file=$1
    echo "Validating $file..."
    
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "❌ File not found: $file"
        return 1
    fi
    
    # Check JSON syntax
    if jq '.' "$file" >/dev/null 2>&1; then
        echo "✅ JSON syntax check passed"
    else
        echo "❌ JSON syntax check failed"
        return 1
    fi
    
    # Check for required fields in mcp.json
    if [[ "$file" == *"mcp.json" ]]; then
        # Check for servers array
        if jq -e '.servers' "$file" >/dev/null 2>&1; then
            echo "✅ Contains servers array"
        else
            echo "❌ Missing servers array"
            return 1
        fi
        
        # Check each server configuration
        local server_count=$(jq '.servers | length' "$file")
        echo "Found $server_count server configurations"
        
        for i in $(seq 0 $((server_count-1))); do
            # Check required fields for each server
            local name=$(jq -r ".servers[$i].name" "$file")
            local type=$(jq -r ".servers[$i].type" "$file")
            local command=$(jq -r ".servers[$i].command" "$file")
            
            echo "Validating server: $name"
            
            if [ "$name" = "null" ]; then
                echo "❌ Server $i missing name"
                return 1
            fi
            
            if [ "$type" = "null" ]; then
                echo "❌ Server $name missing type"
                return 1
            fi
            
            if [ "$command" = "null" ]; then
                echo "❌ Server $name missing command"
                return 1
            fi
            
            echo "✅ Server $name configuration valid"
        done
    fi
    
    return 0
}

# Test cases
echo "Validating JSON configurations..."
echo "--------------------------------"

# Test mcp.json
validate_json_file "$HOME/dotfiles/.cursor/mcp.json"

# Add more test cases as needed 