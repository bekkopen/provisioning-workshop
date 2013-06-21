#/bin/bash

rsync -p -g -o -r -a -v -z -e "ssh -l root" --delete cfengine/masterfiles root@176.58.118.245:/var/cfengine

