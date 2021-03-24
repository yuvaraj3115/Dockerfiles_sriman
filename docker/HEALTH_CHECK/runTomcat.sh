#!/bin/bash
function runTomcat() {
    cd /opt/apache-tomcat-9.0.26/bin
    ./startup.sh
}

runTomcat
exec $@