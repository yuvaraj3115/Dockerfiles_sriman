FROM ubuntu:18.10
ARG site
ENV siteName=${site}
RUN apt-get update
RUN apt-get install -y apache2
#RUN mkdir /var/www/eshop
#RUN echo 'Hello World' >> /var/www/eshop/stories.txt
#VOLUME [ "/var/www/eshop" ]
#EXPOSE 8080:80/tcp
COPY apache2Configure.sh /usr/local/bin
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
RUN ["chmod","+x","/usr/local/bin/apache2Configure.sh"]
RUN ["chmod","+x","/usr/local/bin/healthcheck.sh"]
#ENTRYPOINT [ "apache2Configure.sh","eshop" ]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail http://localhost:8080/ || exit 1
ENTRYPOINT apache2Configure.sh ${siteName} 


