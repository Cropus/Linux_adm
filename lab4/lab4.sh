#!/bin/sh

#1
sudo yum install group "Development Tools"

#2
cd /mnt/share
tar -zxvf bastet-0.43 -C ~/lab4
cd ~/lab4
mv bastet-0.43 bastet
cd bastet
#install boost libraries
yum update
yum install epel-release
yum instal boost boost-thread boost-devel
#install curses.h
yum install ncurses-devel ncurses
#continue
make
# check
./bastet
nano Makefile
#add to Makefile
"install:[\n TAB] cp ~/lab4/bastet/bastet /usr/bin [\n TAB] chmod 775 /usr/bin/bastet"


#3
yum list installed > ~/lab4/task3.log
#or
rpm -qa > ~/lab4/task3.log

#4
yum deplist gcc | egrep "*dependency*" > ~/lab4/task4_1.log
yum provides "*libgcc*" > ~/lab4/task4_2.log

#5
mkdir /root/localrepo
cp /mnt/share/checkinstall-1.6.2-3.el6.1.x86_64.rpm /root/localrepo
yum install createrepo
createrepo ~/localrepo
cd /etc/yum.repos.d
nano local.repo
#add to local.repo
"[Local]"
"name=localrepo"
"baseurl=file:/root/localrepo/"
"enabled=1"
"gpgcheck=0"

#6
yum repolist > ~/lab4/task6.log

#7
#disable repositories: foreach in yum repolist enabled=0
yum list available
yum install checkinstall.x86_64

#8
cp /mnt/share/fortunes-ru_1.52-2_all.deb ~/
cd
#enable repositories
yum install alien
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i --force ~/*.rpm

#9
yum install wget
yum install file-devel
yum install groff
yum install texinfo

wget http://vault.centos.org/8.1.1911/BaseOS/Source/SPackages/nano-2.9.8-1.el8.src.rpm
rpm2cpio nano-2.9.8-1.el8.src.rpm | cpio -dimv
#edit nano.spec
echo "alias newnano=nano" >> /etc/bashrc

cp nano-2.9.8.tar.gz ~/rpmbuild/SOURCES
cp nanorc ~/rpmbuild/SOURCES
rpmbuild -bb nano.spec
dnf reinstall ~/rpmbuild/RPMS/x86_64/nano-2.9.8-1.el8.x86_64.rpm
exit
