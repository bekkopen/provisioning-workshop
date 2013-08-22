#!/bin/bash

sudo yum -y install salt-minion
sudo chkconfig salt-minion on
sudo service salt-minion start

