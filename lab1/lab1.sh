#!/bin/sh

#1
mkdir test

#2
ls -la /etc >> test/list

#3
cd /etc
find * -maxdepth 0 -type d | wc -l >> ~/test/list
find . -maxdepth 1 -type f | egrep "\./\." | wc -l >> ~/test/list
cd
#4
mkdir ~/test/links

#5
ln ~/test/list ~/test/links/list_hlink

#6
ln -s ~/test/list ~/test/links/list_slink

#7
ls -l ~/test/links/list_hlink
ls -l ~/test/list
ls -l ~/test/links/list_slink

#8
cat ~/test/list | wc -l >> ~/test/links/list_hlink

#9
diff ~/test/links/list_hlink ~/test/links/list_slink && echo "YES" || echo "NO"

#10
mv ~/test/list ~/test/list1

#11
diff ~/test/links/list_hlink ~/test/links/list_slink && echo "YES" || echo "NO"

#12
ln ~/test/links/list_hlink ~/list1

#13
find /etc -type f -name *.conf >> ~/list_conf

#14
find /etc -maxdepth 1 -type d -name *.d >> ~/list_d

#15
cat ~/list_conf list_d > ~/list_conf_d

#16
mkdir ~/test/.sub

#17
cp ~/list_conf_d ~/test/.sub/

#18
cp -b ~/list_conf_d ~/test/.sub/

#19
ls -Rla ~/test/

#20
man man > ~/man.txt

#21
split -b 1024 ~/man.txt

#22
mkdir ~/man.dir

#23
mv ~/x* ~/man.dir

#24
cat ~/man.dir/x* >> ~/man.dir/man.txt

#25
diff ~/man.txt ~/man.dir/man.txt && echo "YES" || echo "NO"

#26
cat ~/man.txt > ~/main
echo "The First Line" > ~/intro
echo "The Last Line" > ~/end
cat ~/intro ~/main ~/end > ~/man.txt
rm -f ~/main
rm -f ~/intro
rm -f ~/end

#27
diff ~/man.txt ~/man.dir/man.txt > ~/file.patch

#28
mv ~/file.patch ~/man.dir/file.patch

#29
patch ~/man.dir/man.txt ~/man.dir/file.patch

#30
diff ~/man.txt ~/man.dir/man.txt && echo "YES" || echo "NO"

exit
