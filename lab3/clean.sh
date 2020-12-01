#!/bin/sh

groupdel g1
chown u1 /var/spool/mail/u1
userdel -r u1
chown u2 /var/spool/mail/u2
userdel -r u2
rm -rf /home/test13
rm -rf /home/test14
rm -rf /home/test15

exit
