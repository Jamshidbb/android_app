#!/bin/bash
echo "Setting up Gradle cache..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ~/.gradle
if [ -d ~/.gradle/caches ] && [ ! -L ~/.gradle/caches ]; then
    mv ~/.gradle/caches ~/.gradle/caches.backup.$(date +%s)
fi
if [ -d ~/.gradle/wrapper ] && [ ! -L ~/.gradle/wrapper ]; then
    mv ~/.gradle/wrapper ~/.gradle/wrapper.backup.$(date +%s)
fi
rm -f ~/.gradle/caches
rm -f ~/.gradle/wrapper
if [ -d "$SCRIPT_DIR/caches" ]; then
    ln -sfn "$SCRIPT_DIR/caches" ~/.gradle/caches
    echo "✅ Linked dependency cache"
fi
if [ -d "$SCRIPT_DIR/wrapper" ]; then
    ln -sfn "$SCRIPT_DIR/wrapper" ~/.gradle/wrapper
    echo "✅ Linked wrapper distributions"
fi
echo ""
cat "$SCRIPT_DIR/cache-info.txt"
echo ""
echo "✅ Setup complete! Run: ./gradlew build"
