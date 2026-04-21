#!/bin/bash

echo "====================================="
echo "  Git + Clone Setup (Mac)"
echo "====================================="

echo ""
echo "1. Checking Git..."

if ! command -v git &> /dev/null
then
    echo "Git not found. Installing..."

    # Homebrewがあるか確認
    if command -v brew &> /dev/null
    then
        brew install git
    else
        echo "Please install Homebrew first:"
        echo "https://brew.sh/"
        exit 1
    fi
fi

echo ""
echo "2. Checking Git version..."
git --version

echo ""
echo "3. Cloning repository..."
cd ~/Documents
git clone https://github.com/TUMH0404/python-stud.git

echo ""
echo "All done."
