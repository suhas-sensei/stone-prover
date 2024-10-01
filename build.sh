#!/bin/bash

echo "Starting build process..."

# Check for target architecture
if [ -z "$TARGET_ARCH" ]; then
    echo "TARGET_ARCH not set. Defaulting to x86_64"
    TARGET_ARCH="x86_64"
fi

echo "Building for architecture: $TARGET_ARCH"

# Run Bazel build
echo "Running Bazel build..."
bazelisk build --cpu=$TARGET_ARCH //...

# Run tests with verbose output to debug any issues
echo "Running Bazel tests with verbose output..."
bazelisk test --cpu=$TARGET_ARCH --test_output=all //...

# Check the result of the Bazel test
if [ $? -eq 0 ]; then
    echo "Build and tests completed successfully."
else
    echo "Build or tests failed."
    exit 1
fi
