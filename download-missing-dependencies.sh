#!/bin/bash
echo "Downloading missing Gradle dependencies..."

# Generate wrapper if missing
if [ ! -f "gradlew" ]; then
  gradle wrapper
fi

# Download dependencies
./gradlew dependencies

echo "✓ Missing dependencies downloaded"
