# Add My Account

## Usage

All you have to do is copy/paste two commands to the shell and then I
can help you fix your server:

First command downloads the script:
```bash
wget https://raw.githubusercontent.com/mnebuerquo/add-my-account/master/add-my-account.sh
```

Second command executes the script:
```bash
sudo sh add-my-account.sh
```

## Problem

I have a recurring problem where someone needs to give me access to a
server so I can help them troubleshoot a problem. Often they have a
person with sudo access but without a great knowledge of Linux. My goal
is to send them a one-liner which they can paste into their terminal to
give me login and sudo access on their server.

## Goals

These are the goals of this project:

1. This needs to be a one-liner which can be pasted into a terminal. It
   probably needs to be a two-liner. [Don't pipe to your
shell!](https://www.seancassidy.me/dont-pipe-to-your-shell.html)
	* First command is wget from raw.github.com
	* Second command is execute script.

2. Other than logging in and using sudo, the user should need no
   knowledge of unix. The user must log in to do anything, and 
to create another user account will need sudo.

3. It will send me the information I need to be able to log in to the
   server. Until I have an interface for emailing me a password or
whatever, I'll provide the user instructions to copy/paste from their
terminal to an email.

## Features

These are features the program will one day have:

1. Create my user account if it doesn't already exist. *Complete*

2. Grant my account sudo access. *Complete*

3. Set a random password on my account. *Complete*

4. Install my public key so I can log in without a password. *Complete*

5. Post to SSL endpoint with IP of server, temporary password, so it can
   send me an email to notify me.

6. Load username, key url, and notification endpoint from config file.

I initially wanted it to also install my dotfiles in my account, but on
production servers that's not a good idea. This should be a generic
script which can be used anywhere.

## Links

* http://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/
* http://www.cyberciti.biz/faq/changing-password-of-specific-account-in-linux-commandline/
* http://unix.stackexchange.com/a/57804/85863
* https://www.seancassidy.me/dont-pipe-to-your-shell.html
