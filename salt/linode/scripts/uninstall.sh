#/bin/bash

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

if [ "${master}" == ${host} ]; then
  ssh root@${host} "service salt-master stop"
  ssh root@${host} "chkconfig --del salt-master"
  ssh root@${host} "yum -y remove salt-master"
elif [ "${minion}" == ${host} ]; then
  ssh root@${host} "service salt-minion stop"
  ssh root@${host} "chkconfig --del salt-minion"
  ssh root@${host} "rpm -qa | grep -i epel-release | xargs rpm -e"
  ssh root@${host} "service nginx stop"
  ssh root@${host} "chkconfig --del nginx"
  ssh root@${host} "yum -y remove nginx"
  ssh root@${host} "userdel devops"
  ssh root@${host} "userdel nginx"
  ssh root@${host} "rm /etc/init.d/devops"
  ssh root@${host} "rm /etc/nginx/conf.d/devops.conf"
else
  echo "Illegal host: ${host}. Should be ${master} or ${minion}."
  exit 1
fi
