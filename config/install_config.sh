#!/bin/bash

# Installation Configuration
# This file controls the behavior of the installation scripts

# Package Management
PACKAGE_UPDATE_MODE="check"  # Options: "check" (skip if installed), "update" (update if installed), "force" (reinstall)
PACKAGE_CLEANUP_AFTER_INSTALL=false  # Whether to run cleanup after package installation

# Installation Components
INSTALL_PACKAGES=true
INSTALL_LANGUAGES=true
INSTALL_TOOLS=true
INSTALL_DESKTOP=true

# Verbosity
VERBOSE=true  # Whether to show detailed output
DEBUG=false   # Whether to show debug information

# Backup Settings
BACKUP_BEFORE_INSTALL=true
BACKUP_DIR="$HOME/.dotfiles_backup"

# Function to load user overrides if they exist
load_user_overrides() {
    if [ -f "$HOME/.dotfiles_config.sh" ]; then
        source "$HOME/.dotfiles_config.sh"
    fi
}

# Load any user-specific overrides
load_user_overrides

# Export variables for use in other scripts
export PACKAGE_UPDATE_MODE
export PACKAGE_CLEANUP_AFTER_INSTALL
export INSTALL_PACKAGES
export INSTALL_LANGUAGES
export INSTALL_TOOLS
export INSTALL_DESKTOP
export VERBOSE
export DEBUG
export BACKUP_BEFORE_INSTALL
export BACKUP_DIR 