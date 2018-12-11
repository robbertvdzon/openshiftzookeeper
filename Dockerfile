FROM openshift/redhat-openjdk18-openshift:latest

RUN wget -q -O - http://mirror.csclub.uwaterloo.ca/apache/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.7 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
