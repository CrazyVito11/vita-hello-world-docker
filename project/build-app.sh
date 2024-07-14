#!/usr/bin/env bash

set -e

# Create the build directory from scratch (if it exists)
if [ -d "build" ]; then
  rm -rf build
fi


# Build the application
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
