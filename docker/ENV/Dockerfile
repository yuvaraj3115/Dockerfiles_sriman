FROM ubuntu:18.10
ENV tomcat_home=/opt/apache-tomcat-9.0.26/bin
ENV PATH=$PATH:${tomcat_home}
WORKDIR /opt
ADD http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.26/bin/apache-tomcat-9.0.26.tar.gz .
RUN gunzip apache-tomcat-9.0.26.tar.gz
RUN tar -xvf apache-tomcat-9.0.26.tar
RUN rm -rf apache-tomcat-9.0.26.tar
CMD startup.sh