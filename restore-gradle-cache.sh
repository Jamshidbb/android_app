#!/bin/bash
if [ -d "gradle-cache" ]; then
  gradle-cache/restore.sh
else
  echo "Error: gradle-cache directory not found"
fi
