#!/usr/bin/bash

BASE_DIR="$(dirname "$0")"

echo "Installing configs"
echo
for config in "$BASE_DIR"/.[^.]*; do
    if [ -f "$config" ]; then
        echo "Installing config $config"
        cp "$config" "$HOME"
    fi
done

echo "Installing homebrew utils"
echo
cp -R "$BASE_DIR/.local" "$HOME"

echo "Installing various tools"
echo
pip install --ignore-installed --user   \
    gdb-tools                           \
    norsu

echo "Creating symlinks"
echo
ln -s /usr/bin/nvim "$HOME/.local/bin/vim"
