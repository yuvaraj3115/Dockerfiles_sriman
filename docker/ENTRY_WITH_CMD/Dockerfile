FROM ubuntu:18.10
COPY loop.sh /usr/local/bin
COPY print.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/loop.sh"]
RUN ["chmod","+x","/usr/local/bin/print.sh"]
ENTRYPOINT [ "loop.sh" ]  
#CMD ["print.sh"]