#!/bin/bash 

pid=$1

basefolder=/proc/$pid/fd 
logfile=/tmp/fdleak.txt


if [ -e $basefolder ] 
then
   echo continuing

else
   echo $basefolder does not exist
   exit
fi

rm $logfile

counter=0
iterations=500000
for ((counter=0;counter < iterations; ++counter))
do
   date >> $logfile
    echo "fd count" >>  $logfile

   ls $basefolder | wc -l >> $logfile
   echo " # of open files " >> $logfile
   lsof |grep tomcat | wc -l >> $logfile
   echo " # of tooy man files  " >> $logfile
   grep -i "too many" /x/tomcat/apac*/logs/catalina* | wc -l >> $logfile

   sleep 300
done

