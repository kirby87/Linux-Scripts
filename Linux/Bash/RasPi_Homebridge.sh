#!/bin/sh

# This will install home bridge on your raspberry-pi.
### This must be run as sudo ###

# Need to update your system
echo "Updateing"
apt-get update
echo "Upgrading"
apt-get upgrade

# Check the version of Node on the System
echo Checking the version of Node on your system
NODE_VERSION=node --version
echo $NODE_VERSION
if [[ $NODE_VERSION -ge 4.3]]; then 
    VAR_INSTALL="Yes"
else
    VAR_INSTALL="No"
fi

# Install homebridge
if [[$VAR_INSTALL="Yes"]]; then
   echo "Installing HomeBridge now."
   # Install the libavahi-compat-libdnssd-dev package: 
   sudo apt-get install libavahi-compat-libdnssd-dev
   # Install Homebridge using npm:
   sudo npm install -g --unsafe-perm homebridge
elseif [[ $VAR_INSTALL="No" ]]; then
  echo "Not Cool. You need to get a new version of Node on your system."
  sleep 3
  exit 0
else
  echo "Something went wrong."
fi
