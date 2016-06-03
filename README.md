# awstats
Docker image for awstats

Dit image bevat een apache en awstats installatie. 

_Bouwen_: docker build -t awstats2 .

_Runnen_: docker run -it  -v ~/Documents/docker/awstats/other_vhosts_access.log:/var/log/apache2/other_vhosts_access.log awstats2

_Webpagina_: http://HOST/awstats/awstats.pl?config=stats

------

De volgende omgevingsvariabelen worden gebruikt in de awstats configuratie (awstats.stats.conf):

 AWSTATS_CONF_LOGFILE="/var/log/apache2/other_vhosts_access.log"
 
 AWSTATS_CONF_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
 
 AWSTATS_CONF_SITEDOMAIN="www.idgis.nl"
 
Op de volgende locaties :

 LogFile="\_\_AWSTATS_CONF_LOGFILE\_\_"

 LogFormat=\_\_AWSTATS_CONF_LOGFORMAT\_\_

 SiteDomain="\_\_AWSTATS_CONF_SITEDOMAIN\_\_"

 HostAliases="localhost 127.0.0.1 \_\_AWSTATS_CONF_SITEDOMAIN\_\_"

Andere configuratie settings zijn default ingesteld zoals het niet meetellen van requests vanuit IDgis:

SkipHosts="127.0.0.1 83.247.8.136 78.46.96.163 localhost REGEX[^192\.168\.] REGEX[^10\.]"
