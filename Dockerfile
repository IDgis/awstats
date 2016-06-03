FROM ubuntu:14.04

RUN apt-get -y update  && apt-get install -y awstats && apt-get install -y apache2

ADD ./awstats.stats.conf /etc/awstats/awstats.stats.conf
ADD ./apache2.awstats.conf /etc/apache2/sites-available/

ADD ./run.sh /

ENV AWSTATS_CONF_LOGFILE="/var/log/apache2/other_vhosts_access.log"
ENV AWSTATS_CONF_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
ENV AWSTATS_CONF_SITEDOMAIN="www.idgis.nl"

WORKDIR /

RUN service apache2 start
RUN a2enmod cgi
RUN a2ensite apache2.awstats.conf
RUN service apache2 restart
# RUN service apache2 reload

CMD /run.sh
