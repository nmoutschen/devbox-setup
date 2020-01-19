#!/bin/bash

set -e

if [ "$EUID" -e 0 ]; then
    echo "Do not run this script as root."
    echo "This script will run the sudo command as needed."
    exit 1
fi

# Install python 3.8.1
bash python.sh 3.8.1

# Install node 12.x
bash node.sh 12.x

# Install go 1.13
bash go.sh 1.13