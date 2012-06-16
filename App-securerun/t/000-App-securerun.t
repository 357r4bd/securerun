#!/bin/sh

OUTPUT=`securerun -nosplash -h ../samples/GENERIC.srhosts.pl -f ../samples/installtest.xml`
if [ "$OUTPUT" == "Testing Securerun: ...ok" ]; then
  echo ok 1 - install test works
else
  echo not ok 1 - something is wrong
fi
echo 1..1

rm -rf TEST*
