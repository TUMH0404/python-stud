#!/bin/bash

TARGET="$HOME/Documents/python-stud"

echo "Checking existing folder..."

if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
    echo "Folder deleted."
else
    echo "Folder does not exist."
fi

echo "Moving to Documents..."
cd "$HOME/Documents" || exit 1

echo "Cloning repository..."
git clone https://github.com/TUMH0404/python-stud.git

echo "Moving into project folder..."
cd "$HOME/Documents/python-stud" || exit 1

echo "All done."

