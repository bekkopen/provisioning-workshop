#/bin/bash

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# resolve symlinks
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd ${BASEDIR}

rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete ../../masterfiles root@policyserver.devops.smat.cc:/var/cfengine
ssh root@policyserver.devops.smat.cc "chown -R root:root . ; /var/cfengine/bin/cf-agent -Kv -f /var/cfengine/inputs/update.cf"
