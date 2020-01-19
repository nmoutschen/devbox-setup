#!/bin/bash

set -e

# Check if running as root
if [ "$EUID" -e 0 ]; then
    echo "Do not run this script as root."
    echo "This script will run the sudo command as needed."
    exit 1
fi

# Gather Node version
NODE_VERSION=$1
if [ -z "$NODE_VERSION" ]; then
    echo "Usage: $0 version"
    exit 1
fi

# Install Node
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -