#!/bin/bash

set -e

# Check if running as root
if [ "$EUID" -e 0 ]; then
    echo "Do not run this script as root."
    echo "This script will run the sudo command as needed."
    exit 1
fi

# Gather Node version
GO_VERSION=$1
if [ -z "$GO_VERSION" ]; then
    echo "Usage: $0 version"
    exit 1
fi

# Install Go
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-${GO_VERSION}-go