FROM ubuntu:18.10
COPY runTomcat.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/runTomcat.sh"]
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y curl
WORKDIR /opt
ADD http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.26/bin/apache-tomcat-9.0.26.tar.gz .
RUN gunzip apache-tomcat-9.0.26.tar.gz
RUN tar -xvf apache-tomcat-9.0.26.tar
RUN rm apache-tomcat-9.0.26.tar
COPY healthcheck.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/healthcheck.sh"]
ENTRYPOINT [ "runTomcat.sh" ]
HEALTHCHECK CMD curl -f http://localhost:8080 || exit 1
CMD ["tail -f /dev/null"]
