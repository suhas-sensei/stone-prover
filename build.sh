#!/bin/bash

# Check for target architecture
if [ -z "$TARGET_ARCH" ]; then
    echo "TARGET_ARCH not set. Defaulting to x86_64"
    TARGET_ARCH="x86_64"  # Default to x86_64 if not set
fi

# Set Bazel architecture
if [ "$TARGET_ARCH" == "x86_64" ]; then
    arch="x86_64"
elif [ "$TARGET_ARCH" == "arm64" ]; then
    arch="arm64"
else
    echo "Unknown architecture: $TARGET_ARCH"
    exit 1
fi

echo "Building for architecture: $arch"

# Use bazelisk to build for the specified architecture
bazelisk build --cpu=$arch //...

# Optionally, run tests
bazelisk test --cpu=$arch //...

# Continue with other build steps, if needed
