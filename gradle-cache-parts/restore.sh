#!/bin/bash
echo "Restoring Gradle cache from split parts..."

# Check if all parts exist
MISSING=0
for part in gradle-cache.zip.part-*; do
    if [ ! -f "$part" ]; then
        echo "Missing: $part"
        MISSING=1
    fi
done

if [ $MISSING -eq 1 ]; then
    echo "ERROR: Missing parts. Please download all parts first."
    exit 1
fi

# Combine parts
echo "Combining parts..."
cat gradle-cache.zip.part-* > gradle-cache.zip

# Verify checksum
echo "Verifying checksum..."
sha256sum -c checksum.txt

if [ $? -ne 0 ]; then
    echo "ERROR: Checksum verification failed!"
    exit 1
fi

# Extract
echo "Extracting to ~/.gradle/..."
unzip -q gradle-cache.zip -d $HOME/

# Cleanup
rm gradle-cache.zip

echo "✅ Gradle cache restored successfully!"
echo "Cache location: ~/.gradle/caches/"
