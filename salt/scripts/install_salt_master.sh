#!/bin/bash

sudo yum -y install salt-master
sudo chkconfig salt-master on
sudo cp /vagrant/files/master /etc/salt/master
sudo service salt-master start

sudo /usr/bin/salt-key -A && echo Keys: && sudo /usr/bin/salt-key -L && echo Ping && sudo /usr/bin/salt '*' test.ping

