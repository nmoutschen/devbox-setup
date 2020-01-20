#!/bin/bash

set -e

# Check if running as root
if [ "$EUID" -e 0 ]; then
    echo "Do not run this script as root."
    echo "This script will run the sudo command as needed."
    exit 1
fi

# Gather Python version
PYTHON_VERSION=$1
if [ -z "$PYTHON_VERSION" ]; then
    echo "Usage: $0 version"
    exit 1
fi

# Ensure that the required packages are installed
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Install pyenv
curl https://pyenv.run | bash
cat >> ~/.bashrc << EOF
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

# Reload bashrc
. ~/.bashrc

# Install Python version
pyenv install $PYTHON_VERSION

# Set the default Python version
pyenv global $PYTHON_VERSION

# Install common tools
pip install -r $(dirname $0)/python-requirements.txt
