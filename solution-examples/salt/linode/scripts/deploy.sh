#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <hostname>"
  exit 1
fi

host=${1}

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# resolve symlinks
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd ${BASEDIR}
cd ..

master="master.devops.smat.cc"
minion="salt.devops.smat.cc"

if [ "master" == "${host}" ]; then
  host=${master}
elif [ "salt" == "${host}" ]; then
  host=${minion}
elif [ "minion" == "${host}" ]; then
  host=${minion}
fi

if [ "${master}" == "${host}" ] || [ "${minion}" == "${host}" ]; then

  rsync -r -a -v -z -e "ssh -l root" ../../salt/ root@${host}:

  cmd="ln -nsf /usr/share/zoneinfo/Europe/Oslo /etc/localtime ; "
  cmd+="/etc/init.d/iptables stop ; "
  cmd+="mkdir -p .ssh ; "
  cmd+="chown -R root:root . ; "
  cmd+="chmod 550 ./ ; chmod 700 .ssh ; chmod 644 .ssh/id_rsa.pub .ssh/known_hosts ; chmod 600 .ssh/id_rsa .ssh/authorized_keys ; "
  cmd+="hostname ${host} ; echo \"hostname set to ${host}\" ; "
  cmd+="grep -q salt /etc/hosts 2> /dev/null && echo || echo \"178.79.152.151   salt   ${minion}\" >> /etc/hosts ; "
  cmd+="grep -q master /etc/hosts 2> /dev/null && echo || echo \"151.236.216.254   master     ${master}\" >> /etc/hosts ; "
  cmd+="yum -y upgrade python ; "
  cmd+="rpm -q epel-release || rpm -Uvh http://ftp.linux.ncsu.edu/pub/epel/6/i386/epel-release-6-8.noarch.rpm ; "
  [ "${minion}" == "${host}" ] && cmd+="yum -y install salt-minion ; chkconfig salt-minion ;  "
  [ "${master}" == "${host}" ] && cmd+="yum -y install GitPython ; yum -y install salt-master ; chkconfig salt-master on ; "
  [ "${minion}" == "${host}" ] && cmd+="cp linode/files/minion /etc/salt/ ; service salt-minion start"
  [ "${master}" == "${host}" ] && cmd+="cp -f linode/files/master /etc/salt/ ; service salt-master start ; sleep 10 ; /usr/bin/salt-key -A -y && /usr/bin/salt-key -L ; sleep 10 ; salt '*' state.highstate"
  
  ssh -tt -o StrictHostKeyChecking=no root@${host} "${cmd}"

else
  echo "Illegal host: ${host}. Should be ${master} or ${minion}." && exit 1
fi

