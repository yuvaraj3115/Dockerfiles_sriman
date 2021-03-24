#!/bin/bash
set -e
for i in {1..5}
do
    echo $i
done
#echo "$@"
exec $@