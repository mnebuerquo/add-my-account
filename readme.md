# Add My Account

## Problem

I have a recurring problem where someone needs to give me access to a
server so I can help them troubleshoot a problem. Often they have a
person with sudo access but without a great knowledge of Linux. My goal
is to send them a one-liner which they can paste into their terminal to
give me login and sudo access on their server.

## Goals

These are the goals of this project:
1. This needs to be a one-liner which can be pasted into a terminal.
2. Other than logging in and using sudo, the user should need no
   knowledge of unix.
3. It will send me the information I need to be able to log in to the
   server.

## Features

These are features the program will one day have:
1. Create my user account if it doesn't already exist.
2. Grant my account sudo access.
3. Set a random password on my account. 
4. Git clone my dotfiles and install them (https clone, without key)
5. Post to SSL endpoint with IP of server, temporary password, so it can
   send me an email to notify me.

## Links

http://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/
http://www.cyberciti.biz/faq/changing-password-of-specific-account-in-linux-commandline/

