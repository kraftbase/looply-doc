#!/bin/bash
# Python 3.12 Installation Script for macOS

# Check if Python 3.12 is already installed
if command -v python3.12 &> /dev/null
then
    echo "Python 3.12 is already installed."
    python3.12 --version
    exit 0
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Python 3.12
brew install python@3.12

# Add Python 3.12 to PATH
echo 'export PATH="/usr/local/opt/python@3.12/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Verify Python installation
python3.12 --version

echo "Python 3.12 installed successfully!"