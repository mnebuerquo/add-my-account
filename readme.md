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

*Sherman:* (Thinking: I'm not going to add a new account, we're just going 
to get a key installed. I'll fix it later if necessary, once I can do it
myself.) 
First type "cd", tilde, then enter. Now you're at the home directory of the 
account. Next, type "cd", space, ".ssh" then enter. Now you're in the .ssh 
directory where the keys are.

*CEO Neil:* Ok. I got it.

*Sherman:* Type "ls" then enter. You should see a file called authorized_keys.

*CEO Neil:* Yes. I see it.

*Sherman:* I'm not going to ask you to use vim unless we have to. I'm
going to dictate a command to you, and you'll need to type it exactly as
I describe.

*CEO Neil:* OK.

*Sherman:* Type echo, space, double quote, then paste the contents of
that key file into your terminal. Then type another double quote, space, 
then two greater than signs, space, then authorized_keys. Now hit enter.

*CEO Neil:* OK.

*Sherman:* Did you do that? Any errors?

*CEO Neil:* Did it. No errors.

*Sherman:* Now type tail authorized_keys and tell me what you see.

*CEO Neil:* I see a bunch of random stuff, then an email address at the
end.

*Sherman:* Ok. I'm going to try my login now. 

*Sherman:* That didn't work. There are probably spaces or newlines in the 
file. We're going to have to use vim. (Thinking: Do I know any other
editors installed by default well enough to talk him through it blind?
Probably not.)

*CEO Neil:* OK.

*Sherman:* Type vim authorized_keys, then hit enter. You'll see the
contents of the file with a bar across the bottom containing the
filename.

*CEO Neil:* OK.

*Sherman:* Type colon, dollarsign, enter. Now type caret. Is the cursor
at the start of that key, probably looks like its a few lines from the
end of the file?

*CEO Neil:* I think so. No, I think it's in the middle of the key.

*Sherman:* Ok, type a lowercase k to move the cursor up a line. You'll
need to be at the first line of my key. Look for the starting characters
from the file I emailed you. They'll probably be the next line after an 
email address. If you go too far, hit a lowercase j to move down a line.
Did you get the cursor to the start of the key?

*CEO Neil:* I think so. 

*Sherman:* Good. Now type capital J to join the current line and next line, 
then lowercase x to remove the space between them. You'll probably repeat that
once or twice more. There should be a space between the end of the key and 
the comment portion with my email address.

*CEO Neil:* OK.

*Sherman:* Were you able to remove the spaces?

*CEO Neil:* I think so.

*Sherman:* Ok. Good. Now type colon, w, q, enter. That will save and
exit vim.

*CEO Neil:* OK. That exited.

*Sherman:* Ok. I'm going to try my login again.

*Sherman:* Ok! I'm in! Checking for sudo... Yes. I have sudo. I didn't
need a password. Now I can figure out what went wrong. I'll call 
you back when I have it up and running.

*... A few minutes later ...*

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

4. Other people can fork this repo and change some configuration for
   their public keys and user names, then they can do the same thing.

## Features

These are features the program will one day have:

1. Create my user account if it doesn't already exist. *Complete*

2. Grant my account sudo access. *Complete*

3. Set a random password on my account. *Complete*

4. Install my public key so I can log in without a password. *Complete*

5. Post to SSL endpoint with IP of server, temporary password, so it can
   send me an email to notify me.

6. Load username, key url, and notification endpoint from config file.

7. Make my remote endpoint send me a text instead of an email.

I initially wanted it to also install my dotfiles in my account, but on
production servers that's not a good idea. This should be a generic
script which can be used anywhere.

## Links

* http://www.systutorials.com/39549/changing-linux-users-password-in-one-command-line/
* http://www.cyberciti.biz/faq/changing-password-of-specific-account-in-linux-commandline/
* http://unix.stackexchange.com/a/57804/85863
* https://www.seancassidy.me/dont-pipe-to-your-shell.html
