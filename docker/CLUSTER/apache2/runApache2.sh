#!/bin/bash
function runApache2() {
    if [ -e "/etc/apache2" ]
    then
        service apache2 start
    fi
}
runApache2
echo "Apache2 started"
exec $@