FROM docker.io/bitnami/jenkins:2

USER root
RUN mkdir -p /opt/maven
RUN curl -o /opt/maven/apache-maven-3.8.1-bin.tar.gz https://mirrors.advancedhosters.com/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
RUN cd /opt/maven && tar -xvzf apache-maven-3.8.1-bin.tar.gz -C /opt/maven/ --strip-components=1
RUN cd /opt/maven && ln -s /opt/maven/bin/mvn /usr/bin/mvn