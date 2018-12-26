FROM openshift/redhat-openjdk18-openshift:latest

RUN curl https://www-us.apache.org/dist/zookeeper/zookeeper-3.5.4-beta/zookeeper-3.5.4-beta.tar.gz --output zookeeper.tar.gz \
    && gunzip zookeeper.tar.gz \
    && tar -xvf zookeeper.tar \
    && mv /home/jboss/zookeeper-3.5.4 /home/jboss/zookeeper \
    && cp /home/jboss/zookeeper/conf/zoo_sample.cfg /home/jboss/zookeeper/conf/zoo.cfg

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ENTRYPOINT ["/home/jboss/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
