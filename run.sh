#!/bin/bash


# SED magic to replace placeholders with content of env vars

sed -i  's/__AWSTATS_CONF_LOGFILE__/'"$AWSTATS_CONF_LOGFILE"'/g' /etc/awstats/awstats.stats.conf
sed -i  's/__AWSTATS_CONF_LOGFORMAT__/'"$AWSTATS_CONF_LOGFORMAT"'/g' /etc/awstats/awstats.stats.conf
sed -i  's/__AWSTATS_CONF_SITEDOMAIN__/'"$AWSTATS_CONF_SITEDOMAIN"'/g' /etc/awstats/awstats.stats.conf

service apache2 start

while [ true ] ; 
do
/usr/bin/perl /usr/lib/cgi-bin/awstats.pl -config=stats -update
sleep 600
done
