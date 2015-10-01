#!/bin/bash

# USAGE: ./tests.sh <path to hfilter executable>

EXAMPLES_DIR=`pdw`/examples
E1=${EXAMPLES_DIR}/Sample1.csv
E2=${EXAMPLES_DIR}/Sample2.csv
E3=${EXAMPLES_DIR}/Sample3.csv

if [ ! -d $E1 ] || [ ! -d $E2 ] || [ ! -d $E3 ]
then
    cat <<EOF
One or more test files could not be found
please run this script inside 2015-2-lab2/

Instructions:

git clone https://github.com/agomezl/2015-2-lab2.git
cd 2015-2-lab2
./tests.sh <path to hfilter executable>
EOF
fi



if [ $# -ne 1 ]
then
    exit 1
fi

echo "### Test 1 ###"
$1 $E1 '^J' '^[^@]+@[^@]+$' '^[0-9]+$'
echo "### Test 2 ###"
$1 $E2 '^A' '^R' '.*' 'E$' '.*' '.*' '.*'  '^04' '.*' '.*' '.*'
echo "### Test 3 ###"
$1 $E3 '^-' '^[0-9]+$' '.*' '.*' '.*'
