#!/bin/bash

<<info
This script will install package
that you pass in the argumats

e.g ./install-pkg.sh nginx
e.g ./install-pkg.sh docker.io
e.g ./install-pkg.sh unzip
info

echo "Installing $1"

sudo apt-get update > /dev/null
sudo apt-get install $1 -y

echo "Installation Complete"

