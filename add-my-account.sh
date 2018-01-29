#!/bin/sh
# This script originally from https://github.com/mnebuerquo
# https://github.com/mnebuerquo/add-my-account
# To use this for your own purposes, feel free to fork my repo.

# Change these configuration variables in your own fork:
USERNAME=sherman
#SSHKEYURL="https://s3.amazonaws.com/login-keys/combined"
SSHKEYURL="https://s3.amazonaws.com/login-keys/spatial_laptop"
# end of configuration

# find out if we're sudo
if [ $(id -u) -ne 0 ]; then
	echo "This script must be run with sudo.";
	exit 1;
fi

# GH-3 need to know if wget is installed
if command -v wget >/dev/null 2>&1; then
	DOWNLOAD="wget -O"
elif command -v curl >/dev/null 2>&1; then
	DOWNLOAD="curl -o"
else
	echo "Either wget or curl must be installed!";
	exit 2;
fi

# figure out the user's home directory path
USERHOME=$(getent passwd $USERNAME | cut -f6 -d:)

# generate random password
# generate password in advance in case we need it
# http://serverfault.com/a/261417/33170
PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1);
PASSWD_MESSAGE=""

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
	PASSWD_MESSAGE="User password set to $PASSWORD so make sure to text it to $USERNAME."
	echo

else
	echo "User $USERNAME already exists here."
fi

# make sure new user is in sudo group
echo "Adding user to sudo: $USERNAME"
adduser $USERNAME sudo

# ensure user ssh directory exists
SSHDIR="$USERHOME/.ssh"
echo "Creating .ssh directory: $SSHDIR"
mkdir -p $SSHDIR
chown $USERNAME:$USERNAME $SSHDIR
chmod 700 $SSHDIR

# download my public keys
echo "Downloading my public keys..."
TEMPKEYS="$USERNAME-public-keys.pub"
CMD="$DOWNLOAD $TEMPKEYS $SSHKEYURL"
echo $CMD
eval $CMD

# add my key to authorized_keys
AUTHORIZED_KEYS="$USERHOME/.ssh/authorized_keys"
echo "Adding my public keys to my authorized_keys file: $AUTHORIZED_KEYS"
cat $TEMPKEYS $AUTHORIZED_KEYS | sort -u > $AUTHORIZED_KEYS
chown $USERNAME:$USERNAME $AUTHORIZED_KEYS
chmod 700 $AUTHORIZED_KEYS

# Show the password last so it isn't lost among the other messages
echo $PASSWD_MESSAGE

# clean up downloaded file after
rm $TEMPKEYS
