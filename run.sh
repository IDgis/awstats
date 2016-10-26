#!/bin/bash

export AWSTATS_CONF_LOGFILE
export AWSTATS_CONF_LOGFORMAT
export AWSTATS_CONF_SITEDOMAIN

service apache2 start

while [ true ] ; 
do
/usr/bin/perl /usr/lib/cgi-bin/awstats.pl -config=stats -update
sleep 600
done
