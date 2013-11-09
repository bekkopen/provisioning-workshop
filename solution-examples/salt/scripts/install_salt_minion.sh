#!/bin/bash

sudo yum -y install salt-minion
sudo chkconfig salt-minion on
sudo cp /vagrant/files/minion /etc/salt/minion
sudo service salt-minion start

