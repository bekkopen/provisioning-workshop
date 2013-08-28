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

if [ "${policyserver}" == "${host}" ] || [ "${client}" == "${host}" ]; then

  rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete scripts root@${host}:
  rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete files root@${host}:

  deployers_key="$(cat ~/.ssh/id_rsa.pub)" && echo "deployers key is ${deployers_key}"
  ssh root@${host} "mkdir -p .ssh && chown -R root:root ./ && ./scripts/ssh_keys.sh \"${deployers_key}\" && ./scripts/ssh_credentials.sh"
  scp ../ssh/id_rsa* root@${host}:.ssh/
  ssh root@${host} "hostname ${host} && echo \"hostname set to ${host}\""
  ssh root@${host} ./scripts/hosts.sh
  ssh root@${host} ./scripts/timezone.sh
  ssh root@${host} ./scripts/disable_firewall.sh
  ssh root@${host} ./scripts/install_cfengine.sh
  [ "${policyserver}" == "${host}" ] && rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete ../masterfiles root@${host}:/var/cfengine || echo "Host is not ${policyserver}. Skipping rsync of masterfiles"
  ssh root@${host} ./scripts/add-agent.sh
  #ssh root@${host} ./scripts/ssh_test.sh
[ "${client}" == "${host}" ] && ssh root@${host} ./scripts/start-agent.sh || echo "Host is not ${client} Skipping start-agent.sh"
else
  echo "Illegal host: ${host}. Should be ${policyserver} or ${client}." && exit 1
fi
