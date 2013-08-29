#/bin/bash

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# resolve symlinks
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd ${BASEDIR}
cd ..


rsync -r -a -v -z -e "ssh -l root" ../../salt/ root@master.devops.smat.cc:
ssh root@master.devops.smat.cc "chown -R root:root . ; cp -f linode/files/master /etc/salt/ ; salt '*' state.highstate"
