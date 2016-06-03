FROM ubuntu:latest
RUN apt-get -y update  && apt-get install -y awstats && apt-get install -y apache2
ADD ./awstats.template.conf /etc/awstats/awstats.template.conf
ADD ./apache2.awstats.conf /etc/apache2/sites-available/
RUN 
# ADD ./add-awstats-conf.sh /
ADD ./awstats.linoxide.conf /usr/lib/cgi-bin/awstats/awstats.linoxide.conf
ADD ./awstats.stats.conf /usr/lib/cgi-bin/awstats/awstats.stats.conf
ADD ./run.sh /

ENV AWSTATS_CONF_LOGFILE="/var/log/apache2/other_vhosts_access.log"
ENV AWSTATS_CONF_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
ENV AWSTATS_CONF_SITEDOMAIN="www.idgis.nl"

WORKDIR /

CMD /run.sh

