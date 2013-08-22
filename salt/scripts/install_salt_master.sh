#!/bin/bash

sudo yum -y install salt-master
sudo chkconfig salt-master on
sudo mv /vagrant/files/master /etc/salt/master
sudo service salt-master start

