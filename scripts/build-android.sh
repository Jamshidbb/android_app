#!/bin/bash

# Script to build Android project
# Usage: ./build-android.sh [debug|release]

set -e  # Exit on error

BUILD_TYPE=${1:-debug}

echo "🔨 Building Android project ($BUILD_TYPE)..."

# Check if gradlew exists
if [ ! -f "gradlew" ]; then
    echo "❌ gradlew not found! Please run create-android-project.sh first."
    exit 1
fi

# Make gradlew executable if not already
chmod +x gradlew

# Clean previous builds
echo "🧹 Cleaning previous builds..."
./gradlew clean --no-daemon

# Sync project and build dependencies
echo "🔄 Syncing project..."
./gradlew build --no-daemon --stacktrace || {
    echo "⚠️ Build failed, attempting to sync dependencies..."
    ./gradlew --refresh-dependencies --no-daemon
}

# Build APK
echo "📦 Building APK ($BUILD_TYPE)..."
if [ "$BUILD_TYPE" = "release" ]; then
    ./gradlew assembleRelease --no-daemon
else
    ./gradlew assembleDebug --no-daemon
fi

# Build AAB (Android App Bundle)
echo "📦 Building AAB ($BUILD_TYPE)..."
if [ "$BUILD_TYPE" = "release" ]; then
    ./gradlew bundleRelease --no-daemon
else
    ./gradlew bundleDebug --no-daemon
fi

echo "✅ Build completed successfully!"

# Display build outputs
echo "📁 Build outputs:"
if [ -d "app/build/outputs/apk" ]; then
    echo "APK files:"
    find app/build/outputs/apk -name "*.apk" -type f
fi

if [ -d "app/build/outputs/bundle" ]; then
    echo "AAB files:"
    find app/build/outputs/bundle -name "*.aab" -type f
fi
