Create SMTP Credential
  From SES home and and click on SMTP Setting (left hand side menu)
  Write down the AWS email server something like 
           email-smtp.us-west-2.amazonaws.com Ports 465, or 587
  Click on Create SMTP Credential Button (write down the User-String and Passwd-String
       SMTP Username: B0IA3KTKJ25TOVNADIVT
       SMTP Password: BD70jyAa8zN+1xTcDkjdepBDectMTc9nGcq1YKoFFT3R
Creat Configuration Set
      Configuration Sets --> Create Configuration Set  (Event Destinations is None)
      Give it a name - toai-test-ses
Validate your From Email Address
       Click on Email Address (left hand side menu) 
       Enter your From Email and AWS will send you a confirm/verify who you are email.
       Open your mailbox and follow the instruction to confirm.
       Validated mrtoai@yahoo.com toaivo@gmail.com and toaivo@stanford.edu

============================================================
SendEmail in Shell
   openssl s_client -crlf -quiet -starttls smtp -connect email-smtp.us-west-2.amazonaws.com:587 < ses-input.txt    OR
   openssl s_client -crlf -quiet -connect email-smtp.us-west-2.amazonaws.com:465 < ses-input.txt

Note the userid and passwd has been encoded with base64 using echo “xxx” | base64 --encode

The ses-input.txt is
EHLO example.com
AUTH LOGIN
DKBDEOBX39DKALXLD
QkQ1aGdVQWo0Rkl2WkKDM0VvNWDRJYdTSHhPYXdzUnRDR1ZHeDJrV01iR1o=
MAIL FROM: yhinc@yahoo.com
RCPT TO: jaameee10239@yahoo.edu
DATA
X-SES-CONFIGURATION-SET: toai-test-ses
From: Toai Vo <yhinc@yahoo.com>
To: jaameee10239@yahoo.com
Subject: Amazon SES SMTP Test

This message was sent using the Amazon SES SMTP interface.
.
QUIT
===========================================================
SENDING USING PYTHON
   
sessmtp.env        - setting aws ses credential and configuration
htmlmail.txt       - Email content in html format
textmail.txt       - Email content in txt formal

bulkmail.sh        - use to send email to list of users reading from mail.list
sessmtp_bulk.templ - template used by bulkmail.sh to generate sessmtp_bulk.py
sessmtp_bulk.py    - generated python script by bulkmail.sh
mail.list          - list of email addresses used by bulkmail.sh

sendmail.sh        - use to send one email to recipient specified in the sessmtp.env
sessmtp.templ      - template uses by sendmail.sh to generate python sessmtp.py
sessmtp.py         - python script generated by sendmail.sh

README.txt         - This file.
