#!/bin/bash

#  pause every second after sending this number of email
export limit=3
export total=0

#. ./sessmtp.env
. $HOME/bin/sessmtp.env

export cnt=1
# file contains email address of the recipients
INFILE=mail.list
if [ ! -f $INFILE ] ; then
   echo "File $INFILE does not exist"
   exit 1
fi

# generate the sessmtp_bulk.py python script 
cat sessmtp_bulk.templ | gomplate > sessmtp_bulk.py

while read mailuser
do
	echo "sending $mailuser"
	python3 sessmtp_bulk.py $mailuser
	((total=total+1))
	((cnt=cnt+1))
	if [ $cnt -gt $limit ] ; then
	   echo "Sleeping ... $cnt"
	   sleep 1
	   cnt=1
	fi
done < $INFILE
echo "Sent $total emails"
