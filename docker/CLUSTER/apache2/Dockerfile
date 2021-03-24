FROM ubuntu:18.10
ARG SITE_NM
ARG TOMCAT_HOST
ARG TOMCAT_PORT
ENV SITE_NM=${SITE_NM}
ENV TOMCAT_HOST=${TOMCAT_HOST}
ENV TOMCAT_PORT=${TOMCAT_PORT}
ENV APACHE2_MODULES = "proxy proxy_http proxy_ajp rewrite deflate headers proxy_balancer proxy_connect proxy_html"
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y curl
RUN for MODULE_NM in ${APACHE2_MODULES}; do a2enmod ${MODULE_NM}; done;
WORKDIR /etc/apache2/sites-available
RUN touch ${SITE_NM}.conf
RUN chmod +rwx ${SITE_NM}.conf
RUN echo "<VirtualHost *:80> \n ProxyPreserveHost On \n ProxyPass / http://${TOMCAT_HOST}:${TOMCAT_PORT}/ \n ProxyPassReverse / http://${TOMCAT_HOST}:${TOMCAT_PORT}/ \n ServerName localhost \n </VirtualHost>" >> ${SITE_NM}.conf
RUN a2ensite ${SITE_NM}
COPY runApache2.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/runApache2.sh"]

ENTRYPOINT [ "runApache2.sh" ]
HEALTHCHECK CMD "curl -f http://localhost:80" || exit 1
CMD [ "tail -f /dev/null" ]