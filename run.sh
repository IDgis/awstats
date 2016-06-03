#!/bin/bash

service apache2 start

while [ true ] ; 
do
/usr/bin/perl /usr/lib/cgi-bin/awstats/awstats.pl -config=linoxide -update
/usr/bin/perl /usr/lib/cgi-bin/awstats/awstats.pl -config=stats -update
sleep 600
done
