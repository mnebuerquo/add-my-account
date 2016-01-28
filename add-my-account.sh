#!/bin/sh

# find out if we're sudo
if [ $(id -u) -ne 0 ]; then
	echo "This script must be run with sudo.";
	exit 1;
fi

USERNAME=sherman

# next determine if user exists
# create user if not
NEED_USER=$(id -u $USERNAME > /dev/null 2>&1; echo $?)

echo $NEED_USER;

