#!/bin/bash

mkdir $HOME/test
echo `ls -ap $HOME` > $HOME/test/list
mkdir $HOME/test/links
ln $HOME/test/list $HOME/test/links/list_link
rm $HOME/test/list
cat $HOME/test/links/list_link
ln $HOME/test/links/list_link $HOME/list1
echo `sudo find /etc -type f | grep \\.conf` > $HOME/list_conf
echo `ls -p /etc | grep -v / | grep "\\.d"` > $HOME/list_d
cat $HOME/list_conf > $HOME/list_conf_d && cat $HOME/list_d >> $HOME/list_conf_d
ln -s $HOME/list_conf_d $HOME/test/links/list_conf_d_link
ln $HOME/list1 $HOME/test/links/links_list1
less $HOME/test/links/list_conf_d_link
mkdir $HOME/test/.sub
cp $HOME/list_conf_d $HOME/test/.sub/list_conf_d
cp -f $HOME/list_conf_d $HOME/test/.sub/list_conf_d
mv $HOME/test/.sub/list_conf_d $HOME/test/.sub/list_etc
rm $HOME/list_conf_d

echo "should be error: "
cat $HOME/test/links/list_conf_d_link

cal 2000 > $HOME/test/calenar.txt 
head -9 $HOME/test/calenar.txt
ls -a $HOME/test
echo `ls -l $HOME/test/links/list_link | awk '{ print $2 }'`

man man > $HOME/man.txt
split -b 1000 $HOME/man.txt
mkdir $HOME/man.dir
mv x* $HOME/man.dir
cat $HOME/man.dir/x* > $HOME/man.dir/man.txt

if [[ `diff $HOME/man.txt $HOME/man.dir/man.txt` ]]; then
	echo "NOT OK"
else
	echo "OK"
fi

sed -i -e '1 s/^/Bang bang, he shot me down\n/;' $HOME/man.txt
echo "Bang bang, I hit the ground" >> $HOME/man.txt
diff -u $HOME/man.dir/man.txt $HOME/man.txt > $HOME/man_diff
mv $HOME/man_diff $HOME/man.dir/man_diff
patch $HOME/man.dir/man.txt $HOME/man.dir/man_diff

if [[ `diff $HOME/man.txt $HOME/man.dir/man.txt` ]]; then
	echo "NOT OK"
else
	echo "OK"
fi
