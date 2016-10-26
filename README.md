# awstats
Docker image for awstats

Dit image bevat een apache en awstats installatie. 

_Bouwen_: ``docker build -t awstats2 .``

_Runnen_: ``docker run -it -p 8082:80  -v ~/Documents/docker/awstats/other\_vhosts\_access.log:/var/log/apache2/other\_vhosts\_access.log awstats2``

_Webpagina_: ``http://localhost:8082/cgi-bin/awstats.pl?``

------

De volgende omgevingsvariabelen worden gebruikt in de awstats configuratie (awstats.stats.conf):
 (Default wordt other\_vhost\_access.log gebruikt)

 AWSTATS_CONF_LOGFILE="/var/log/apache2/other\_vhosts\_access.log"
 
 AWSTATS_CONF_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
 
 AWSTATS_CONF_SITEDOMAIN="awstats"
 
Op de volgende locaties :

 LogFile="\_\_AWSTATS_CONF_LOGFILE\_\_"

 LogFormat=\_\_AWSTATS_CONF_LOGFORMAT\_\_

 SiteDomain="\_\_AWSTATS_CONF_SITEDOMAIN\_\_"

 HostAliases="localhost 127.0.0.1 \_\_AWSTATS_CONF_SITEDOMAIN\_\_"

Andere configuratie settings zijn default ingesteld zoals het niet meetellen van requests vanuit IDgis:

SkipHosts="127.0.0.1 83.247.8.136 78.46.96.163 localhost REGEX[^192\.168\.] REGEX[^10\.]"

