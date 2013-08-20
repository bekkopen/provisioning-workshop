#/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 \<ip-address\>"
  exit 1
fi

ip=${1}

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# resolve symlinks
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd ${BASEDIR}
cd ..

rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete masterfiles root@${ip}:/var/cfengine

