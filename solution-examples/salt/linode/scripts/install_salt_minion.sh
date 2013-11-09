#!/bin/bash

yum -y install salt-minion
chkconfig salt-minion on
cp linode/files/minion /etc/salt/
service salt-minion start

