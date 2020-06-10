#!/bin/bash

T_DIR=$@

FILE="$(basename ${T_DIR})"
FILE_NAME=${FILE}$(date +"%m%d%H%M")


echo "START Running Jmeter on `date`"
echo "jmeter -n -t /jmeter_scripts${T_DIR}.jmx -l /report/${FILE_NAME}.jtl -e -o /report/${FILE_NAME} "

sh /opt/apache-jmeter-5.1.1/bin/jmeter.sh -n -t /jmeter_scripts${T_DIR}.jmx -l /report/${FILE_NAME}.jtl -e -o /report/${FILE_NAME}

echo "END Running Jmeter on `date`"   

echo "======== Raw Test Report ========"

cat /report/${FILE_NAME}.jtl | sed 's/,/ ,/g' | column -t -s, | less -S

echo "See raw test report in /report/${FILE_NAME}.jtl"


echo "======== HTML Test Report ========"

echo "See HTML test report in /report/${FILE_NAME}/index.html"

/bin/bash

#!/bin/bash

T_DIR=$@

FILE="$(basename ${T_DIR})"
FILE_NAME=${FILE}$(date +"%m%d%H%M")


echo "START Running Jmeter on `date`"
echo "jmeter -n -t /jmeter_scripts${T_DIR}.jmx -l /report/${FILE_NAME}.jtl -e -o /report/${FILE_NAME} "

sh /opt/apache-jmeter-5.1.1/bin/jmeter.sh -n -t /jmeter_scripts${T_DIR}.jmx -l /report/${FILE_NAME}.jtl -e -o /report/${FILE_NAME}

echo "END Running Jmeter on `date`"   

echo "======== Raw Test Report ========"

echo "See raw test report in /report/${FILE_NAME}.jtl"


echo "======== HTML Test Report ========"

echo "See HTML test report in /report/${FILE_NAME}/index.html"

/bin/bash
