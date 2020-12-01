#!/bin/sh

#clean
./clean.sh

#1
awk -F: '{print "user " $1 " has id " $3}' < /etc/passwd > work3.log

#2
chage -l root | head -1 >> work3.log

#3
cut -d: -f1 < /etc/group | tr -s '\n' ',' >> work3.log

#4
echo "Be careful!" > /etc/skel/readme.txt

#5
useradd -p $(openssl passwd -crypt 12345678) u1

#6
groupadd g1

#7
usermod -G g1 u1

#8
echo "" >> work3.log
id u1 | cut -d ' ' -f1,3 >> work3.log

#9
usermod -a -G g1 user

#10
egrep "^g1:" /etc/group | cut -d: -f4 >> work3.log

#11
usermod -s /usr/bin/mc u1

#12
useradd -p $(openssl passwd -crypt 87654321) u2

#13
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log

#14
chown u1:u2 /home/test13
chown u1:u2 /home/test13/*
chmod 750 /home/test13
chmod 640 /home/test13/*

#15
mkdir /home/test14
chown u1:u1 /home/test14
chmod +t /home/test14

#16
cp /bin/nano /home/test13/nano
chown u1:u1 /home/test13/nano
chmod +s /home/test13/nano

#17
mkdir /home/test15
touch /home/test15/secret_file
chown root:root /home/test15/secret_file
chmod a-r /home/test15
chmod +t /home/test15/secret_file

exit
