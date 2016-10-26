#!/bin/bash

envsubst < /etc/awstats/awstats.stats.conf.template > /etc/awstats/awstats.conf

service apache2 start

while [ true ] ; 
do
/usr/bin/perl /usr/lib/cgi-bin/awstats.pl -config=stats -update
sleep 600
done
