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

policyserver="policyserver.devops.smat.cc"
client="cfengine.devops.smat.cc"

if [ "policyserver" == "${host}" ]; then
  host=${policyserver}
elif [ "cfengine" == "${host}" ]; then
  host=${client}
elif [ "client" == "${host}" ]; then
  host=${client}
fi

if [ "${client}" == "${host}" ]; then
  ssh root@${host} "service nginx stop"
  ssh root@${host} "chkconfig --del nginx"
  ssh root@${host} "yum -y remove nginx"
  ssh root@${host} "userdel -r devops"
  ssh root@${host} "userdel -r nginx"
  ssh root@${host} "rm /etc/init.d/devops"
  ssh root@${host} "rm /etc/nginx/conf.d/devops.conf"
elif [ "${policyserver}" == "${host}" ]; then
  echo "Skipping removal of provisioned stuff because I am ${host}"
else
  echo "Illegal host: ${host}. Should be ${policyserver} or ${client}."
fi

ssh root@${host} "service cfengine3 stop"
ssh root@${host} "chkconfig --del cfengine3"
ssh root@${host} "rpm -qa | grep -i cfengine-community | xargs rpm -e"
ssh root@${host} "rm -Rf /var/cfengine /etc/init.d/cfengine3"

