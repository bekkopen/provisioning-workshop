#!/bin/bash

sudo yum -y install salt-master
sudo chkconfig salt-master on
sudo service salt-master start

