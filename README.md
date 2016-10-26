# awstats
Docker image for awstats

Dit image bevat een apache en awstats installatie. 

_Bouwen_: ``docker build -t awstats2 .``   

_Runnen_: docker run -d -p 8082:80 -v SRC:DST awstats2   
       Bijvoorbeeld:  
          ``docker run -d -p 8082:80 -v ~/Documents/docker/awstats/other_vhosts_access.log:/var/log/apache2/other_vhosts_access.log awstats2``

_Webpagina_: ``http://localhost:8082/cgi-bin/awstats.pl?``

------

De volgende omgevingsvariabelen worden gebruikt in de awstats configuratie (awstats.stats.conf):   
 (Default wordt /var/log/apache2/other\_vhosts\_access.log gebruikt, daar is ook het logformat op afgestemd)

 AWSTATS\_CONF\_LOGFILE="/var/log/apache2/other\_vhosts\_access.log"
 
 AWSTATS\_CONF\_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
 
 AWSTATS\_CONF\_SITEDOMAIN="www.idgis.nl"
 
Op de volgende locaties in awstats.stats.conf:

 LogFile="\_\_AWSTATS\_CONF\_LOGFILE\_\_"

 LogFormat=\_\_AWSTATS\_CONF\_LOGFORMAT\_\_

 SiteDomain="\_\_AWSTATS\_CONF\_SITEDOMAIN\_\_"

 HostAliases="localhost 127.0.0.1 \_\_AWSTATS_CONF_SITEDOMAIN\_\_"

Andere configuratie settings zijn default ingesteld zoals het niet meetellen van requests vanuit IDgis:

SkipHosts="127.0.0.1 83.247.8.136 78.46.96.163 localhost REGEX[^192\.168\.] REGEX[^10\.]"

#known bugs

AWstats (versie 7.4 in Ubuntu 14.04) kan omgevingsvariabelen in configuratie verwerken.   
Bij het inlezen en updaten van een log file worden de omgevingsvariabelen gesubstitueerd, bij het opvragen van de statistieken in een browser niet. Er wordt dan een foutmelding gegeven.

In de huidige awstats.stats.conf configuratie zijn de regels waarin variabele substitutie wordt toegepast daarom _uitgecommentarieerd_ en vervangen door vaste instellingen.   
Deze awstats image verwerkt daardoor alleen other\_vhosts\_access.log van apache.
     
