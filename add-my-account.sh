#!/bin/sh

# find out if we're sudo
if [ $(id -u) -ne 0 ]; then
	echo "This script must be run with sudo.";
	exit 1;
fi

USERNAME=testuser

# generate random password
# generate password in advance in case we need it
# http://serverfault.com/a/261417/33170
PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1);

# next determine if user exists
NEED_USER=$(id -u $USERNAME > /dev/null 2>&1; echo $?)
if [ $NEED_USER -ne 0 ]; then

	# create user if not
	echo "Creating user: $USERNAME"
	adduser --disabled-password --gecos "" $USERNAME

	# change password programmatically
	# this isn't secure against other logged in users who can use w or ps
	# using passwd didn't work for me on ubuntu 14, so use chpasswd instead
	# http://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/
	# http://unix.stackexchange.com/a/57804/85863
	echo "Setting password for $USERNAME."
	echo "$USERNAME:$PASSWORD" | chpasswd
	echo
	echo "User password set to $PASSWORD so make sure to text it to $USERNAME."
	echo

else
	echo "User $USERNAME already exists here."
fi

# make sure new user is in sudo group
echo "Adding user to sudo: $USERNAME"
adduser $USERNAME sudo

