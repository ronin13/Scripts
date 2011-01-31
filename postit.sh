#!/bin/bash
filename="$1"
sed  's/ /!/g' $filename > ${filename}".curl"
api="https://api.del.icio.us/v1/posts/add"
cred="rdprabhu13:13thwarrior"

[ -f ~/bin/posts.sh ] && rm -f ~/bin/posts.sh

for line in `cat $filename".curl"`
do 
	IFS=";"
	data=""
	for j in $line
	do
      data=${data}" --data-urlencode `echo $j | tr '!' ' '`"
	done
	echo "curl -s -o tempfile --user $cred $data $api" >> ~/bin/posts.sh
	echo "if ! grep -q done tempfile;then exit 1;fi" >> ~/bin/posts.sh
	IFS=" "
done
echo "exit 0" >> ~/bin/posts.sh
chmod +x ~/bin/posts.sh
~/bin/posts.sh && [ -f ~/bin/$filename ]  && rm -f ~/bin/$filename  # Indicating consumption

