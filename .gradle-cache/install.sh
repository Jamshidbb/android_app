#!/bin/bash
echo "Installing Gradle cache from branch..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symlinks
mkdir -p ~/.gradle

# Backup existing caches if not already backed up
if [ -d ~/.gradle/caches ] && [ ! -L ~/.gradle/caches ]; then
  echo "Backing up existing cache to ~/.gradle/caches.backup.$(date +%s)"
  mv ~/.gradle/caches ~/.gradle/caches.backup.$(date +%s)
fi

if [ -d ~/.gradle/wrapper ] && [ ! -L ~/.gradle/wrapper ]; then
  echo "Backing up existing wrapper to ~/.gradle/wrapper.backup.$(date +%s)"
  mv ~/.gradle/wrapper ~/.gradle/wrapper.backup.$(date +%s)
fi

# Create symlinks
if [ -d "$SCRIPT_DIR/caches" ]; then
  ln -sfn "$SCRIPT_DIR/caches" ~/.gradle/caches
  echo "✅ Linked dependency cache"
fi

if [ -d "$SCRIPT_DIR/wrapper" ]; then
  ln -sfn "$SCRIPT_DIR/wrapper" ~/.gradle/wrapper
  echo "✅ Linked wrapper distributions"
fi

# Copy wrapper files to project if needed
if [ -d "$SCRIPT_DIR/gradle/wrapper" ] && [ ! -d "gradle/wrapper" ]; then
  mkdir -p gradle
  cp -r "$SCRIPT_DIR/gradle/wrapper" gradle/
  echo "✅ Copied wrapper files"
fi

if [ -f "$SCRIPT_DIR/gradlew" ] && [ ! -f "gradlew" ]; then
  cp "$SCRIPT_DIR/gradlew" .
  chmod +x gradlew
  echo "✅ Copied gradlew script"
fi

echo ""
echo "=== Cache Information ==="
cat "$SCRIPT_DIR/cache-info.txt"
echo ""
echo "✅ Setup complete! You can now run: ./gradlew build"
