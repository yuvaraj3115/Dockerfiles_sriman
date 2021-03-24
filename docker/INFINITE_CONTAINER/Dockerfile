FROM ubuntu:18.10
COPY loop.sh /usr/local/bin
RUN ["chmod","+x","/usr/local/bin/loop.sh"]
ENTRYPOINT [ "loop.sh" ]
CMD ["tail -f /dev/null"]