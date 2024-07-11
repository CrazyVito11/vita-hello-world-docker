#!/usr/bin/env bash

set -e

# Build the application
./build-app.sh

# Send it to our console using ftp
curl --ftp-method nocwd -T ./build/*.vpk "ftp://$VITA_CONSOLE_IP:1337/$VITA_VPK_PATH/"

# Install the VPK
echo vpk "$VITA_VPK_PATH/$PROJECT_TECHNICAL_NAME.vpk" | nc "$VITA_CONSOLE_IP" 1338

# Run the application
echo launch "$PROJECT_TITLE_ID" | nc "$VITA_CONSOLE_IP" 1338
