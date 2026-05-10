#!/bin/bash
# Reassembly script for split zip file
echo "Reassembling android-build-debug-20260510-154205.zip..."
cat android-build-debug-20260510-154205.zip.part* > android-build-debug-20260510-154205.zip
echo "Done! You can now unzip android-build-debug-20260510-154205.zip"
