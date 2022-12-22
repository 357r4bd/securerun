#!/bin/sh

# creating initial entry for this workstation
PERL=`which perl`
SH=`which sh`
HOSTNAME=`hostname`
PLATFORM=`uname -a`

echo "# ADD THE FOLLOWING TO YOUR .srhost.def file"
echo "#----- start -----#"
echo "  ${HOSTNAME} => {"
echo "    MACHINE => \"${PLATFORM}\""
echo "    HOSTINFO =>"
echo "       ["
echo "         #NOTE: the external ip needs to be added (127.0.0.1 always points back to localhost)"
echo "         {name => \"localhost\", ipaddress => \"127.0.0.1\"},"
echo "         {name => \"${HOSTNAME}\", ipaddress => \"127.0.0.1\"},"
echo "       ],"
echo "    INTERP =>"
echo "       ["
SSH=`which ssh`
if [ -e ${SSH} ]; then
  echo "         {alias => \"SSH\", bin => \"${SSH}\", flags => \"\", default_cmd => \"\"}," 
fi
SCP=`which scp`
if [ -e ${SCP} ]; then
   echo "         {alias => \"SCP\", bin => \"${SCP}\", flags => \"\", default_cmd => \"\"}," 
fi
echo "         {alias => \"SH\", bin => \"${PERL}\", flags => \"\", default_cmd => \"%i %a %f\"},"
echo "         {alias => \"PERL\", bin => \"${SH}\", flags => \"\", default_cmd => \"%i %a %f\"},"
echo "       ],"
echo "  },"
echo "#----- end -----#"
