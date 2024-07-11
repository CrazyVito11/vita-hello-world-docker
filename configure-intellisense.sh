#!/bin/bash

set -e

INTELLISENSE_SRC="./intellisense-src"

# Clean up the intellisense-src directory (if it exists)
if [ -d "$INTELLISENSE_SRC" ]; then
  rm -rf "$INTELLISENSE_SRC"
fi

mkdir "$INTELLISENSE_SRC"

docker compose cp "builder:/usr/local/vitasdk/arm-vita-eabi" "$INTELLISENSE_SRC/arm-vita-eabi"

# Mark the directory as read-only, as any changes don't get applied anyways
chmod -R 555 "$INTELLISENSE_SRC"
