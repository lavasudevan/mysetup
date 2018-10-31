#!/bin/bash -xv


curDate=`date '+%Y%m%d_%H%M%S'`
outfile=/home/lavasudevan/cron/compute_usage/compute_instances_details$curDate.txt
outfile=/x/msprest/gcloud_vms.txt
projects='pp-devqa-ms-appsec pp-devqa-ms-cluster pp-devqa-ms-databases pp-devqa-ms-lnp pp-devqa-ms-thirdparty pp-devqa-ms-tools pp-devqa-ms-userstages pp-devqa-titan pp-devqa-userstages'
projects='pp-devqa-ms-cluster'
outfile=gcloud_vms.txt

echo " file ==> " $outfile
for pj in $projects; do
   echo "$pj" 
  /x/tools/google-cloud-sdk/bin/gcloud compute instances list --project $pj --format="csv[no-heading](name,zone,status,labels,creationTimestamp.date(tz=LOCAL))" >> $outfile
done

