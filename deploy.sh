#/bin/bash

rsync -r -a -v -e "ssh -l root" --delete cfengine/ 176.58.118.245:/var/cfengine/masterfile

