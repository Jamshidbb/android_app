#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -d "$SCRIPT_DIR/gradle-cache-parts" ]; then
    cd "$SCRIPT_DIR/gradle-cache-parts"
    ./restore.sh
    cd "$SCRIPT_DIR"
else
    echo "ERROR: gradle-cache-parts directory not found"
    echo "Please run the Gradle Dependencies workflow first"
    exit 1
fi
