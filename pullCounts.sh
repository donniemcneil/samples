#!/bin/sh
# Author: Donnie McNeil
# This script reads in a text file (host_list.txt), loops through assigning a host name to a variable ($BOX)
# performs an ssh to the box, retrieves a text file, does a line count list.

function usage() {
        echo "Usage: $0 iso8601-formatted-date, e.g. 2023-01-01";
}

function log() {
        echo "$(date "+%F %T")  $*";
}

if [ $# -lt 1 ]
then
        usage;
        exit 1;
fi

if [[ "$1" =~ ^([0-9]{4})-?((0[0-9])|(1[012]))-?([0-2][0-9]|3[01])$ ]]
then
#date --date=yesterday +%Y-%m-%d  
        year=${BASH_REMATCH[1]};
        month=${BASH_REMATCH[2]};
        day=${BASH_REMATCH[5]};
else
        usage;
        exit 1;
fi

datePath="${year}-${month}-${day}";
echo "Tallying <redacted> treatment count for" $datePath

rm -f $BOX*
for BOX in $(cat /home/userx/result/host_list.txt); 
    do scp -q runner@$BOX:/tmp/treatmentIds-$datePath.log /home/userx/result/$BOX-$datePath.log; 
done
wc -l novar10* | tail -1 | awk '{$1=$1};1'
