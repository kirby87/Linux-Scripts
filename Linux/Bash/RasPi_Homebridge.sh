#!/bin/bash

# This will install home bridge on your raspberry-pi.
### This must be run as sudo ###

# Need to update your system
echo "Updateing"
apt-get update
echo "Upgrading"
apt-get upgrade

# Check the version of Node on the System
echo Checking the version of Node on your system
NODE_VERSION=$(node --version)
echo "Is $NODE_VERSION greater than v4.3.0? Yes/No"
read VAR_INSTALL

# Install homebridge
if [ "$VAR_INSTALL" == "Yes" ] ;
then
   echo "Installing HomeBridge now."
   # Install the libavahi-compat-libdnssd-dev package: 
   sudo apt-get install libavahi-compat-libdnssd-dev
   # Install Homebridge using npm:
   sudo npm install -g --unsafe-perm homebridge
elseif [ $VAR_INSTALL="No" ] ;
then
  echo "Not Cool. You need to get a new version of Node on your system."
  sleep 3
  exit 0;
else
  echo "Something went wrong.";
fi
