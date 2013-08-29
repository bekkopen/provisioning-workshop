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

  rsync -r -a -v -z -e "ssh -l root" --delete . root@${host}:

  cmd="ln -nsf /usr/share/zoneinfo/Europe/Oslo /etc/localtime ; "
  cmd+="/etc/init.d/iptables stop ; "
  cmd+="mkdir -p .ssh ; "
  cmd+="chown -R root:root . ; "
  cmd+="chmod 550 ./ ; chmod 700 .ssh ; chmod 644 .ssh/id_rsa.pub .ssh/known_hosts ; chmod 600 .ssh/id_rsa .ssh/authorized_keys ; "
  cmd+="hostname ${host} ; echo \"hostname set to ${host}\" ; "
  cmd+="grep -q cfengine /etc/hosts 2> /dev/null || echo \"178.79.163.71   cfengine   ${client}\" >> /etc/hosts ; "
  cmd+="grep -q policyserver /etc/hosts 2> /dev/null || echo \"176.58.98.241   policyserver ${policyserver}\" >> /etc/hosts ; "
  cmd+="yum -y install db4 pcre openssl ; "
  cmd+="rpm -q cfengine-community || rpm -ivh ~/files/cfengine-community-3.5.1-3.x86_64.rpm ; "

  ssh -tt -o StrictHostKeyChecking=no root@${host} "${cmd}"

  [ "${policyserver}" == "${host}" ] && rsync -r -a -v -z -e "ssh -l root" --delete ../masterfiles root@${host}:/var/cfengine || echo "Host is not ${policyserver}. Skipping rsync of masterfiles"

  cmd_after="/var/cfengine/bin/cf-agent --bootstrap policyserver.devops.smat.cc ; "
  cmd_after+="/var/cfengine/bin/cf-agent"
  [ "${policyserver}" == "${host}" ] && cmd_after+=" -f /var/cfengine/inputs/update.cf"
  
  ssh -tt -o StrictHostKeyChecking=no root@${host} "${cmd_after}"

else
  echo "Illegal host: ${host}. Should be ${policyserver} or ${client}." && exit 1
fi
