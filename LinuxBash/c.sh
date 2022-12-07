#!/bin/bash

dir1=$1
dir2=$2
function rmold(){
for i in $(diff $1 $2  |awk -v var="$2:" '(var==$3) {print $4}')
do
if [ -f $2/$i  ] ; then
  if [ $i != "backup.log" ] ; then
rm  -f $2/$i
echo "[ $(date) ] delete file $i"  >> $2/backup.log
   fi
elif [ -d $2/$i ] ; then
rm  -r $2/$i
echo "[ $(date) ] delete directory $i"  >>  $2/backup.log
fi
done
}

function copynew(){
for i in $(diff $1 $2  |awk -v var="$1:" '(var==$3) {print $4}')
do
if [ -f $1/$i ] ; then
cp $1/$i $2
echo "[ $(date) ] create file $i"  >> $2/backup.log
elif  [ -d $1/$i ] ; then
cp -r $1/$i $2
echo "[ $(date) ] create directory $i"   >> $2/backup.log
fi
done
}

copynew $dir1 $dir2
rmold $dir1 $dir2