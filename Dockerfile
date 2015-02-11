# VERSION    1.0
FROM jeanblanchard/busybox-java

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV ls=logstash-1.4.2

RUN curl -kLsS http://download.elasticsearch.org/logstash/logstash/${ls}.tar.gz | gunzip -c | tar -xf - -C /opt &&\
    ln -s /opt/${ls} /opt/logstash

COPY config/* /etc/logstash/config/
COPY patterns/* /etc/logstash/patterns/

EXPOSE 5000

ENTRYPOINT ["/opt/logstash/bin/logstash"]
CMD ["--debug","-f","/etc/logstash/config/"]