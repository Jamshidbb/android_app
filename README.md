# Gradle Cache Branch

This branch contains cached Gradle dependencies for the project.

## Usage

### In GitHub Actions
The cache is automatically used when running workflows.

### Locally
1. Checkout this branch:
   ```bash
   git checkout gradle-cache-branch
   ```

2. Run the installer:
   ```bash
   ./.gradle-cache/install.sh
   ```

3. Switch back to your working branch and build:
   ```bash
   git checkout -
   ./gradlew build
   ```

## Cache Info
- Gradle Version: 9.2.1
- Created: Fri May  8 05:43:30 UTC 2026
- From Commit: 13e365a2cb1ae00a6e6906a368356b4ea0bd3b86
