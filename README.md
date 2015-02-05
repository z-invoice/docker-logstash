Elasticsearch + Logstash + Kibana on Docker wih BusyBox
=========

This packages are build upon BusyBox and provide a minimal footprint. 
The containers are designed to be higly configurable. 


Quick Start
=========
If you have docker-compose installed (aka. fig) just download `docker-compose.yml` and run `docker-compose up -d`

Manual Quick Start
========
```
docker run -d --name elasticsearch -h elasticsearch -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -p 9200:9200 zinvoice/elasticsearch
docker run -d --name logstash -h logstash -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -p 9200:9200 zinvoice/logstash
docker run -d --name kibana -h kibana -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -p 8000:80 sirile/kibanabox
docker run -d --name logspout -h logspout -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -v /var/run/docker.sock:/tmp/docker.sock -p 8100:8000 progrium/logspout syslog://<<IP-OR-HOSTNAME-OF-LOGSTASH>:5000
``` 
When you run dnsdock you can simple put in the dns entry of logstash which is `logstash` 

How is it working
========
Only Elasticsearch and Logstash are provided by us. 
There is already a Kibana image that runs on BusyBox so we use this one instead of creating our own.

We use `progrium/logspout` which is a "docker daemon aware" container that forwards `STDOUT` and `STDERR` streams of ALL running containers to logstash.

We also use dnsdock to avoid the need to link the container together. 

