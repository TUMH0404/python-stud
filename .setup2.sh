#!/bin/bash

TARGET="$HOME/Documents/python-stud"

echo "====================================="
echo "  Git + Clone Setup (Mac)"
echo "====================================="

echo ""
echo "1. Checking existing folder..."

if [ -d "$TARGET" ]; then
    rm -rf "$TARGET"
    echo "Folder deleted."
else
    echo "Folder does not exist."
fi

echo ""
echo "2. Moving to Documents..."
cd "$HOME/Documents" || exit 1

echo ""
echo "3. Checking Git..."

if ! command -v git >/dev/null 2>&1; then
    echo "Git is not installed."
    echo "Please run 'git' once and follow the installation instructions."
    exit 1
fi

echo ""
echo "4. Cloning repository..."

if git clone https://github.com/TUMH0404/python-stud.git; then
    echo "Clone successful."
else
    echo "Clone failed."
    exit 1
fi

echo ""
echo "5. Moving into project folder..."
cd "$TARGET" || exit 1

echo ""
echo "All done."
