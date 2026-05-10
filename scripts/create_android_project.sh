#!/bin/bash

# Function to create Android project structure
create_android_project() {
    echo "Creating Android project with latest template..."
    
    # Create project structure
    mkdir -p app/src/main/java/com/example/myapplication
    mkdir -p app/src/main/res/layout
    mkdir -p app/src/main/res/values
    mkdir -p app/src/main/res/xml
    mkdir -p gradle/wrapper
    
    # Create Gradle files (same content as above)
    # ... (include all the file creation commands from above)
    
    echo "Project created successfully"
}

# Check if project exists
if [ ! -f "app/build.gradle" ] && [ ! -f "app/build.gradle.kts" ]; then
    create_android_project
else
    echo "Project already exists, skipping creation"
fi
