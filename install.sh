#!/usr/bin/bash

BASE_DIR="$(dirname "$0")"

for config in "$BASE_DIR"/.[^.]*; do
    if [ -f "$config" ]; then
        echo "Installing $config"
        cp "$config" "$HOME"
    fi
done
