FROM ubuntu:18.04
ARG site
ENV site_namme=$(site)
RUN apt-get update
RUN apt-get install apache2 -y
COPY ./index.html /var/www/${site_name}/
COPY ./apache2.sh /usr/local/bin
RUN chmod 777 /usr/local/bin/apache2.sh
RUN apache2.sh ${site_name}
CMD ["/usr/sbin/apachectl","-D","FOREGROUND"]

