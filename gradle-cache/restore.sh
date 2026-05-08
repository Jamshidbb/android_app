#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Restoring Gradle dependencies from repo..."

if [ -d "$SCRIPT_DIR/caches" ]; then
  mkdir -p "$HOME/.gradle"
  cp -r "$SCRIPT_DIR/caches" "$HOME/.gradle/"
  echo "✓ Restored caches"
fi

if [ -d "$SCRIPT_DIR/wrapper" ]; then
  mkdir -p "$HOME/.gradle"
  cp -r "$SCRIPT_DIR/wrapper" "$HOME/.gradle/"
  echo "✓ Restored wrapper"
fi

echo "✓ Restore complete"
echo ""
echo "Note: Some large JAR files will be downloaded on first build"
echo "Run './gradlew build' to download missing files"
