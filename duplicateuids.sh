#! /bin/sh
# all UIDs are unique

PASSWD=/etc/passwd
__UIDS=$(awk -F: '{ print $3 }' $PASSWD)
UIDS=$(echo $__UIDS | tr " " "\n" | sort -u | tr "\n" " ")

for i in $UIDS; do
  num=$(awk -F: '($3 == '${i}') { print $1 }' $PASSWD | wc -l)

  if [ $num -gt 1 ]; then
    grep ":${i}:" $PASSWD
  fi
done
