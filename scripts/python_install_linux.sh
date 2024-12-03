#!/bin/bash
# Python 3.12 Installation Script for Linux

# Check if Python 3.12 is already installed
if command -v python3.12 &> /dev/null
then
    echo "Python 3.12 is already installed."
    python3.12 --version
    exit 0
fi

# Update package list
sudo apt-get update

# Install required dependencies
sudo apt-get install -y software-properties-common build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

# Download Python 3.12
wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz
tar -xf Python-3.12.0.tgz
cd Python-3.12.0

# Configure and install
./configure --enable-optimizations
make -j $(nproc)
sudo make altinstall

# Clean up downloaded files
cd ..
rm -rf Python-3.12.0.tgz Python-3.12.0

# Verify Python installation
python3.12 --version

echo "Python 3.12 installed successfully!"