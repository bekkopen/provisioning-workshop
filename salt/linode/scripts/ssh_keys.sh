#!/bin/bash

mkdir -p ~root/.ssh

touch ~root/.ssh/authorized_keys
touch ~root/.ssh/id_rsa.pub
touch ~root/.ssh/id_rsa

deployers_key=${1}

[ $(grep ${deployers_key} ~root/.ssh/authorized_keys | wc -l) -eq 1 ] && echo "Public keys for steinim exists allready for root" || echo ${deployers_key} >> ~root/.ssh/authorized_keys
echo "Installed .ssh files for root salt"

