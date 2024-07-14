#!/usr/bin/env bash

set -e

# Create the build directory from scratch (if it exists)
if [ -d "build" ]; then
  rm -rf build
fi


# Build the application
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make

# Send it to our console using ftp
curl --ftp-method nocwd -T ./*.vpk "ftp://$VITA_CONSOLE_IP:1337/$VITA_VPK_PATH/"

# Closes all running apps
echo destroy | nc "$VITA_CONSOLE_IP" 1338

# Install the VPK
echo vpk "$VITA_VPK_PATH/$PROJECT_TECHNICAL_NAME.vpk" | nc "$VITA_CONSOLE_IP" 1338

# Run the application
echo launch "$PROJECT_TITLE_ID" | nc "$VITA_CONSOLE_IP" 1338
