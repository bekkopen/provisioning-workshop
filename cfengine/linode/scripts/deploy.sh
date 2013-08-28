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
minion="cfengine.devops.smat.cc"

if [ "${policyserver}" == "${host}" ] || [ "${minion}" == "${host}" ]; then

  rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete scripts root@${host}:
  rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete files root@${host}:

  scp ../ssh/id_rsa* root@${host}:
  ssh root@${host} "hostname ${host} && echo \"hostname set to ${host}\""
  ssh root@${host} ./scripts/hosts.sh
  deployers_key=$(cat ~/.ssh/id_rsa.pub)
  ssh root@${host} "./scripts/ssh_keys.sh ${deployers_key}"
  ssh root@${host} ./scripts/ssh_credentials.sh
  ssh root@${host} ./scripts/timezone.sh
  ssh root@${host} ./scripts/disable_firewall.sh
  ssh root@${host} ./scripts/install_cfengine.sh
  [ "${policyserver}" == "${host}" ] && rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete ../masterfiles root@${host}:/var/cfengine || echo "Host is not ${policyserver}. Skipping rsync of masterfiles"
  ssh root@${host} ./scripts/add-agent.sh
  #ssh root@${host} ./scripts/ssh_test.sh
[ "${minion}" == "${host}" ] && ssh root@${host} ./scripts/start-agent.sh || echo "Host is not ${minion} Skipping start-agent.sh"
else
  echo "Illegal host: ${host}. Should be ${policyserver} or ${minion}." && exit 1
fi
