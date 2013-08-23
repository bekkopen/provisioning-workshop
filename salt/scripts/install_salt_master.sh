#!/bin/bash

sudo yum -y install GitPython
sudo yum -y install salt-master
sudo chkconfig salt-master on
sudo cp /vagrant/files/master /etc/salt/master
#sudo scp root@minion:/etc/salt/pki/minion/minion.pub /etc/salt/pki/master/minions/minion.pub
sudo service salt-master start
sleep 10
sudo /usr/bin/salt-key -A -y && sudo /usr/bin/salt-key -L #&& sudo /usr/bin/salt '*' test.ping
sleep 10
sudo salt '*' state.highstate
