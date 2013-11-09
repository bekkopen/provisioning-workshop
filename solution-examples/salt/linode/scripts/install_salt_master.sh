#!/bin/bash

yum -y install GitPython
yum -y install salt-master
chkconfig salt-master on
cp linode/files/master /etc/salt/
service salt-master start
sleep 10
/usr/bin/salt-key -A -y && /usr/bin/salt-key -L
sleep 10
salt '*' state.highstate
