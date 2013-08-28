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

rsync -p -g -o -r -a -v -z -e "ssh -l root" .. root@${host}:

deployers_key=$(cat ~/.ssh/id_rsa.pub)
ssh root@${host} "chown -R root:root ./ && mkdir -p .ssh && linode/scripts/ssh_keys.sh ${deployers_key} && linode/scripts/ssh_credentials.sh"
[ "salt.devops.smat.cc" == "${host}" ] && ssh root@${host} "cp ssh/minion/id_rsa* .ssh/"
[ "master.devops.smat.cc" == "${host}" ] && ssh root@${host} "cp ssh/master/id_rsa* .ssh/"
ssh root@${host} "hostname ${host} && echo \"hostname set to ${host}\""
ssh root@${host} linode/scripts/hosts.sh
ssh root@${host} linode/scripts/timezone.sh
ssh root@${host} linode/scripts/disable_firewall.sh
ssh root@${host} linode/scripts/install_salt.sh
[ "salt.devops.smat.cc" == "${host}" ] && ssh root@${host} "linode/scripts/install_salt_minion.sh"
[ "master.devops.smat.cc" == "${host}" ] && ssh root@${host} "linode/scripts/install_salt_master.sh"
#ssh root@${host} linode/scripts/ssh_test.sh
exit

