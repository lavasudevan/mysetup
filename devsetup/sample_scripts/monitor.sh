#!/bin/bash 

DistList='lavasudevan@xx.com'
URL="http://localhost:8000/port/10316"
MailLog=/tmp/monitor_mail.log
MailSubject="Alert: API Down on `hostname`"
dt=`date '+%Y%m%d_%H%M%S'`

prevLogDir=/tmp/logs
if [ -d $prevLogDir ]; then
   echo " $prevLogDir folder exist"
else
   mkdir $prevLogDir  
fi

prevLogDir=/tmp/logs/$dt

DebugFlag=0
if [ $# -eq 1 ]; then
#   DebugFlag=$1
   DebugFlag=1
fi
if [ $DebugFlag -eq 1 ]; then
   set -xv
   MailSubject="Test:"$MailSubject
fi

curlOptions='--connect-timeout 60 --max-time 300'
echo 'begin time: ' + `date`
rc=$(/usr/bin/curl $curlOptions --write-out %{http_code} --silent --output /dev/null $URL)
echo 'end time: ' + `date`

#echo /dev/null > $MailLog
echo `date` $URL >> $MailLog
echo -e "\nreturn code:$rc" >> $MailLog


appName=stagehelper

#get file descriptor count to check for leak
appPid=`ps -ef | grep $appName | grep -v grep | awk '{print $2};'`
appProcessStartedTime=`ps -ef | grep $appPid | grep -v grep | grep -v start.jar | awk '{print $5 $6};'`
echo "$appName pid $appPid started at $appProcessStartedTime" 
basefolder=/proc/$appPid/fd
fdcount=`ls -al $basefolder | wc -l`
echo "fd count $fdcount" 

if [ $rc -ne 200 ]; then
   echo $URL
   echo "return code:$rc"
   echo App Server is down
   pid=`ps -ef | grep $appName | grep -v grep | awk '{print $2};'`
   appPidList=`ps -ef | grep $pid | grep -v grep | awk '{print $2};'`
   echo -e "\nKilling old processes" >> $MailLog
   for apppid in $appPidList
   do
      echo "kill $apppid" >> $MailLog
      kill -9 $apppid
   done
   echo -e "\nRestarting server " >> $MailLog
   cd /x/msprest/
   logfile=out.txt
   mkdir $prevLogDir
   mv $logfile* $prevLogDir
   echo "old logs at " $prevLogDir >> $MailLog
   ls $prevLogDir >> $MailLog
   rm $logfile*
   /x/msprest/start.sh &
   mailx -s "$MailSubject" $DistList < $MailLog
else

   echo `date` $URL
   echo "return code:$rc"
   echo App Server is up
fi

#rm $MailLog


