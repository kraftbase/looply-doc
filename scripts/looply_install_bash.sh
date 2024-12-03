#!/bin/bash

# Step 1: Verify Python installation
pythonVersion=$(python --version 2>&1)
if [[ $pythonVersion == *"Python"* ]]; then
    echo "Python is installed: $pythonVersion"
else
    echo "Python is not installed."
    exit 1
fi

# Step 2: Create virtual environment if it doesn't exist
envPath="../myenv"
if [ -d "$envPath" ]; then
    echo "Virtual environment already exists."
else
    echo "Creating virtual environment..."
    python -m venv "$envPath"
    if [ -d "$envPath" ]; then
        echo "Virtual environment created successfully."
    else
        echo "Failed to create virtual environment."
        exit 1
    fi
fi

# Step 3: Activate virtual environment
echo "Activating virtual environment..."
source "$envPath/bin/activate"

# Step 4: Upgrade pip
echo "Upgrading pip..."
python -m pip install --upgrade pip

# Step 5: Check if s3-extend is installed
installedPackages=$(pip list)
if echo "$installedPackages" | grep -q "s3-extend"; then
    echo "s3-extend is installed."
else
    echo "s3-extend is not installed."
    echo "Installing s3-extend..."
    pip install s3-extend
fi

# Step 6: Run s3a add
echo "Running s3a add..."
s3a 