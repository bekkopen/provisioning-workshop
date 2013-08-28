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
client="salt.devops.smat.cc"

if [ "master" == "${host}" ]; then
  host=${master}
elif [ "salt" == "${host}" ]; then
  host=${client}
elif [ "minion" == "${host}" ]; then
  host=${client}
fi

if [ "${master}" == "${host}" ] || [ "${client}" == "${host}" ]; then

  rsync -p -g -o -r -a -v -z -e "ssh -l root" .. root@${host}:

  deployers_key="$(cat ~/.ssh/id_rsa.pub)"
  ssh root@${host} "chown -R root:root ./ && mkdir -p .ssh && linode/scripts/ssh_keys.sh "${deployers_key}" && linode/scripts/ssh_credentials.sh"
  ssh root@${host} "cp linode/ssh/id_rsa* .ssh/"
  ssh root@${host} "hostname ${host} && echo \"hostname set to ${host}\""
  ssh root@${host} linode/scripts/hosts.sh
  ssh root@${host} linode/scripts/timezone.sh
  ssh root@${host} linode/scripts/disable_firewall.sh
  ssh root@${host} linode/scripts/install_salt.sh
  [ "${client}" == "${host}" ] && ssh root@${host} "linode/scripts/install_salt_minion.sh"
  [ "${master}" == "${host}" ] && ssh root@${host} "linode/scripts/install_salt_master.sh"
  #ssh root@${host} linode/scripts/ssh_test.sh
else
  echo "Illegal host: ${host}. Should be ${master} or ${client}." && exit 1
fi

