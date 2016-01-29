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

## Use-Case

I have a recurring situation where someone needs to give me access to a
server so I can help them troubleshoot a problem. Many times it has been
a person with sudo access but without a great knowledge of Linux. My goal
is to send them a one-liner which they can paste into their terminal to
give me login and sudo access on their server.

## User Story

_This is a transcript of a fictional phone call between CEO Neil and
Tech Consultant Sherman._

*CEO Neil:* Sherman, someone rebooted the server and now our critical web app 
is down, and no one here knows how to fix it. Our main tech guy is out on a 
camping trip and I can't get him on the phone.

*Sherman:* Ok. I can figure it out, but I'll have to be able to get into
the server and get sudo access.

*CEO Neil:* Great. How do we do that?

*Sherman:* Can someone there log in to the server?

*CEO Neil:* I think so... (shouts across the office and also into the
phone) ... Who has access to the app server? ... Yes, one of us can log
in.

*Sherman:* Ok, can that person run commands with sudo?

*CEO Neil:* I don't know. We'll try it. ... (sets phone down for a minute)
... I think we can. Now what?

*Sherman:* I emailed you my public key file while you were checking for
sudo access. Save that file, and open it in notepad or something. You'll
need to paste that into your terminal session momentarily.

*CEO Neil:* Ok. I got your email and I'm saving the file.

*Sherman:* (thinking hard, because he knows CEO Neil isn't going to know
how to use vim...) Ok. We're going to paste the contents of this file
into the terminal and append them to the authorized_keys file. I'll talk
you through it one character at a time.

*CEO Neil:* Ok. I'm ready.

*Sherman:* (Not going to add a new account, we're just going to get a key
installed. I'll fix it later.) 
First type "cd ~<cr>" Now you're at the home directory of the account.
Next, type "cd .ssh" Now you're in the .ssh directory where the keys
are.

*CEO Neil:* Ok. I got it.

*Sherman:* Type "ls". You should see a file called authorized_keys.

*CEO Neil:* Yes. I see it.

... It just gets more tedious from here. ...

... Fifteen minutes later ...

*Sherman:* Ok! I'm in! Checking for sudo... Yes. I have sudo. Now I can 
figure out what went wrong. I'll call you back when I have it up and 
running.

... Ten minutes later ...

*CEO Neil:* Hello?

*Sherman:* You're back online again. 

*CEO Neil:* Thank you! What was wrong?

*Sherman:* I found some error messages in the
log, there was a configuration error so it couldn't start back up when
someone rebooted the server. I fixed the configuration error and
started it back up, and it should keep going now. It actually took
longer to get me logged in to the server than to fix the problem.

*CEO Neil:* Thank you so much! You've really saved our butts today.


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
