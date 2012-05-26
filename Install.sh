#!/bin/sh

#
# Brett D. Estrade 3 2004 04
# Install script for securerun
#

TAGSET=HTML-Tagset-3.03
PARSER=HTML-Parser-3.35
TAGSETURL=http://www.cpan.org/modules/by-category/15_World_Wide_Web_HTML_HTTP_CGI/HTML/${TAGSET}.tar.gz
PARSERURL=http://www.cpan.org/modules/by-category/15_World_Wide_Web_HTML_HTTP_CGI/HTML/${PARSER}.tar.gz
STARTDIR=`pwd`
THIRDPARTY="${STARTDIR}/thirdparty"
PERL=perl
HOSTNAME=`hostname`
PLATFORM=`${THIRDPARTY}/config.guess`
INSTALLDIR=${HOME}/.securerun-${HOSTNAME}-${PLATFORM}
MODULEDIR=${INSTALLDIR}/PERL5LIB

echo $PLATFORM Detected...
sleep 1

if [ ! -d ${INSTALLDIR} ]; then
  mkdir -p  ${INSTALLDIR}
else
  echo "${INSTALLDIR} exists. Please remove this directory and run Install.sh again."
  exit
fi

cd ${INSTALLDIR}

if [ ! -d ${MODULEDIR} ];then
  mkdir -p ${MODULEDIR}
fi

cd ${MODULEDIR}

# HTML::Tagset
cp "${THIRDPARTY}/${TAGSET}.tar.gz" "${MODULEDIR}/${TAGSET}.tar.gz"

cp "${THIRDPARTY}/${PARSER}.tar.gz" "${MODULEDIR}/${PARSER}.tar.gz"

gunzip -c ${TAGSET}.tar.gz | tar xvf -
gunzip -c ${PARSER}.tar.gz | tar xvf -

cd ${TAGSET}
/usr/bin/perl Makefile.PL && make && make test

TAGSETLIB=`pwd`;
TAGSETLIB="${TAGSETLIB}/blib/lib"
PERL5LIB=${TAGSETLIB}; export PERL5LIB

cd ../${PARSER}
/usr/bin/perl Makefile.PL && make && make test
PARSERLIB=`pwd`
PARSERLIB="${PARSERLIB}/blib/lib:${PARSERLIB}/blib/arch"
PERL5LIB="${TAGSETLIB}:${PARSERLIB}:${PERL5LIB}"; export PERL5LIB

sleep 1
clear
echo "Installing securerun script..."

cd ${INSTALLDIR}
# copy securerun script
if [ ! -d ${INSTALLDIR}/bin ];then
  mkdir ${INSTALLDIR}/bin
fi 
cp "${STARTDIR}/securerun" ./bin/securerun
chmod 755 ./bin/securerun
# copy utils
if [ ! -d ${INSTALLDIR}/utils ];then
  mkdir ${INSTALLDIR}/utils
fi 
cp "${STARTDIR}/utils/srhost.sh" ./utils/srhost.sh
# copy samples
if [ ! -d ${INSTALLDIR}/sample ];then
  mkdir ${INSTALLDIR}/sample
fi 
cp "${STARTDIR}/sample/test.xml" ./sample/test.xml
cp "${STARTDIR}/sample/installtest.xml" ./sample/installtest.xml
# copy samples
if [ ! -d ${INSTALLDIR}/include ];then
  mkdir ${INSTALLDIR}/include
fi
cp "${STARTDIR}/sample/GENERIC.srhosts.def" ./include/GENERIC.srhosts.def


echo ""
SECURERUN_HOST_DEF=${INSTALLDIR}/include/GENERIC.srhosts.def;export SECURERUN_HOST_DEF
cd ${INSTALLDIR}/sample
/usr/bin/perl ${INSTALLDIR}/bin/securerun -nosplash -f installtest.xml

# create resource files for bourne and csh
echo
echo "1) Writing resource files in "
echo ${INSTALLDIR}
echo "for bourne and c-shell include these files to set the appropriate"
echo "environmental variables: PERL5LIB, PATH, AND SECURERUN_HOST_DEF"
echo "2) Files can be sourced using the following methods:"
echo "CSH: "
echo "\"source ${INSTALLDIR}/securerun.rc.csh\""
echo "SH : "
echo "\". ${INSTALLDIR}/securerun.rc.sh\""
cd ${INSTALLDIR}

#csh
echo "setenv PATH ${INSTALLDIR}/bin:\${PATH}" > securerun.rc.csh 
echo "setenv PERL5LIB ${PERL5LIB}" >> securerun.rc.csh 
echo "setenv SECURERUN_HOST_DEF ${INSTALLDIR}/include/GENERIC.srhosts.def" >> securerun.rc.csh 

#sh
echo "PATH=${INSTALLDIR}/bin:\${PATH};export PATH" > securerun.rc.sh 
echo "PERL5LIB=${PERL5LIB};export PERLLIB5" >> securerun.rc.sh 
echo "SECURERUN_HOST_DEF=${INSTALLDIR}/include/GENERIC.srhosts.def;export SECURERUN_HOST_DEF;export SECURERUN_HOST_DEF" >> securerun.rc.sh

# creating initial entry for this workstation
PERL=`which perl`
SH=`which sh`

echo "%MYHOSTS = (" > ./include/${HOSTNAME}.srhosts.pl
echo "  ${HOSTNAME} => {" >> ./include/${HOSTNAME}.srhosts.pl
echo "    MACHINE => \"${PLATFORM}\"" >> ./include/${HOSTNAME}.srhosts.pl
echo "    HOSTINFO =>" >> ./include/${HOSTNAME}.srhosts.pl
echo "       [" >> ./include/${HOSTNAME}.srhosts.pl
echo "         {name => \"localhost\", ipaddress => \"127.0.0.1\"}," >> ./include/${HOSTNAME}.srhosts.pl
echo "       ]," >> ./include/${HOSTNAME}.srhosts.pl
echo "    INTERP =>" >> ./include/${HOSTNAME}.srhosts.pl
echo "       [" >> ./include/${HOSTNAME}.srhosts.pl
SSH=`which ssh`
if [ -e ${SSH} ]; then
  echo "         {alias => \"SSH\", bin => \"${SSH}\", flags => \"\", default_cmd => \"\"}," >> ./include/${HOSTNAME}.srhosts.pl 
fi
SCP=`which scp`
if [ -e ${SCP} ]; then
   echo "         {alias => \"SCP\", bin => \"${SCP}\", flags => \"\", default_cmd => \"\"}," >> ./include/${HOSTNAME}.srhosts.pl 
fi
echo "         {alias => \"SH\", bin => \"${PERL}\", flags => \"\", default_cmd => \"%i %a %f\"}," >> ./include/${HOSTNAME}.srhosts.pl
echo "         {alias => \"PERL\", bin => \"${SH}\", flags => \"\", default_cmd => \"%i %a %f\"}," >> ./include/${HOSTNAME}.srhosts.pl
echo "       ]," >> ./include/${HOSTNAME}.srhosts.pl
echo "  }," >> ./include/${HOSTNAME}.srhosts.pl
echo ");" >> ./include/${HOSTNAME}.srhosts.pl

echo "3) A srhost file was dynamically created for ${HOSTNAME}, and is located at:"
echo "${INSTALLDIR}/include/${HOSTNAME}.srhosts.pl. For help adding more hosts"
echo "to this file, use ${INSTALLDIR}/utils/srhost.sh"
