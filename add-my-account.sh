#!/bin/sh

# find out if we're sudo
if [ $(id -u) -ne 0 ]; then
	echo "This script must be run with sudo.";
	exit 1;
fi



