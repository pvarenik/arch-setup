#!/usr/bin/env bash

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root" 
   exit 1
fi

# Check if running on Arch Linux
if [[ ! -f /etc/arch-release ]]; then
   echo "This script is intended for Arch Linux only"
   exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.sh"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Function to display help
show_help() {
    echo "Arch KDE Setup Script"
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -v, --verbose  Enable verbose output"
    echo "  -s, --skip MODULES  Skip specific modules (comma-separated)"
    echo ""
    echo "This script will install and configure a complete KDE desktop environment"
    echo "on Arch Linux with additional packages and services."
}

# Parse command line arguments
VERBOSE=false
SKIP_MODULES=""
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -s|--skip)
            SKIP_MODULES="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Load configuration
if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
else
    log "Warning: Configuration file not found, using defaults"
    # Set default values
    ENABLE_MULTILIB=true
    ENABLE_SYSTEM_UPDATE=true
    ENABLE_KDE=true
    ENABLE_FONTS=true
    ENABLE_PACKAGES=true
    ENABLE_AUR=true
    ENABLE_SERVICES=true
    ENABLE_SHORTCUTS=true
    ENABLE_FONTCONFIG=true
fi

log "Starting Arch KDE setup..."

# Set verbose option for commands if requested
if [[ "$VERBOSE" == true ]]; then
    set -x
fi

# Set error handling
set -e

# Counter for progress tracking
total_modules=0
completed_modules=0

# Count total modules
for module in "$SCRIPT_DIR"/modules/*.sh; do
    if [[ -f "$module" ]]; then
        ((total_modules++))
    fi
done

# Skip modules if requested
SKIP_LIST=()
if [[ -n "$SKIP_MODULES" ]]; then
    IFS=',' read -ra SKIP_LIST <<< "$SKIP_MODULES"
fi

for module in "$SCRIPT_DIR"/modules/*.sh; do
    if [[ -f "$module" ]]; then
        module_name=$(basename "$module" .sh)
        should_skip=false
        
        # Check if module should be skipped
        for skip_module in "${SKIP_LIST[@]}"; do
            if [[ "$module_name" == "$skip_module" ]]; then
                should_skip=true
                break
            fi
        done
        
        if [[ "$should_skip" == true ]]; then
            ((completed_modules++))
            log "[$completed_modules/$total_modules] Skipping $(basename "$module")"
            continue
        fi
        
        ((completed_modules++))
        log "[$completed_modules/$total_modules] Running $(basename "$module")"
        bash "$module" || {
            log "Error running $(basename "$module")"
            exit 1
        }
    fi
done

log "Arch KDE setup completed successfully!"
