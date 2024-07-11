#!/usr/bin/env bash

set -e

# Build the application
./build-app.sh

# Send it to our console using ftp
curl --ftp-method nocwd -T ./build/*.vpk "ftp://{$VITA_CONSOLE_IP}:1337/{$VITA_VPK_PATH}/"

# Install the VPK
# TODO: Implement this

# Run the application
# TODO: Implement this
