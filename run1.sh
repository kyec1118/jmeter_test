#!/bin/bash

echo "Enter Test Case:"

read T_DIR

FILE="$(basename ${T_DIR})"
FILE_NAME=${FILE}$(date +"%m%d%H%M")


echo "START Running Jmeter on `date`"
echo "jmeter -n -t /jmeter_scripts${T_DIR}.jmx -l /Users/brooke.c/jmeter/report/${FILE_NAME}.jtl -e -o /Users/brooke.c/jmeter/report/${FILE_NAME} "

sh /Users/brooke.c/jmeter/apache-jmeter-5.3/bin/jmeter.sh -n -t /Users/brooke.c/jmeter/jmeter_scripts${T_DIR}.jmx -l /Users/brooke.c/jmeter/report/${FILE_NAME}.jtl -e -o /Users/brooke.c/jmeter/report/${FILE_NAME}

echo "END Running Jmeter on `date`"   

echo "==== Raw Test Report ===="

cat /Users/brooke.c/jmeter/report/${FILE_NAME}.jtl | sed 's/,/ ,/g' | column -t -s, | less -S

echo "==== HTML Test Report ===="

echo "See HTML test report in /Users/brooke.c/jmeter/report/${FILE_NAME}/index.html"

open /Users/brooke.c/jmeter/report/${FILE_NAME}/index.html
