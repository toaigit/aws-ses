#!/bin/bash
#  this script will send one email using aws ses.
#  All you need is create the email file (either text, or html) named in 
#  the environment variable TEXTFILE and HTMLFILE.

#  Form email specify in the sessmtp.env file must be verified by AWS.
#  Please review sessmt.env for correctnness.

#. ./sessmtp.env

. $HOME/bin/sessmtp.env

if [ -f $TEXTFILE ] || [ -f $HTMLFILE ] ; then
	cat sessmtp.templ | gomplate > sessmtp.py
else
	echo "$TEXTFILE and $HTMLFILE doesn't exist"
	exit 1
fi

python3 sessmtp.py
