# VERSION    1.0
FROM jeanblanchard/busybox-java

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV ls=logstash-1.4.2

RUN curl -kLO http://download.elasticsearch.org/logstash/logstash/${ls}.tar.gz &&\
    gunzip ${ls}.tar.gz &&\
    tar -xf ${ls}.tar -C /opt &&\
    rm ${ls}.tar

COPY logstash-syslog.json /etc/logstash/logstash-syslog.json

EXPOSE 5000

ENTRYPOINT ["/opt/${el}/bin/logstash"]
CMD ["-f","/etc/logstash/logstash-syslog.json"]