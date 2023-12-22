#!/bin/sh

if [ -e packages ]; then
  cd packages && sudo dpkg -i *.deb
else
  echo "No packages directory found."
  echo "This script is only needed for artifact evaluation."
  echo "When using this repository normally, it should not be run."
fi

