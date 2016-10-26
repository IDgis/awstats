FROM ubuntu:latest

RUN apt-get -y update  && apt-get install -y awstats && apt-get install -y apache2 && apt-get install -y wget

ADD ./awstats.stats.conf /etc/awstats/awstats.conf
ADD ./apache2.awstats.conf /etc/apache2/sites-available/

RUN a2enmod cgi && a2ensite apache2.awstats 

ADD ./run.sh /

ENV AWSTATS_CONF_LOGFILE="/var/log/apache2/other_vhosts_access.log"
ENV AWSTATS_CONF_LOGFORMAT="%referer %host %logname %other %time1 %methodurl %code %bytesd %refererquot %uaquot"
ENV AWSTATS_CONF_SITEDOMAIN="awstats"

WORKDIR /

CMD /run.sh
