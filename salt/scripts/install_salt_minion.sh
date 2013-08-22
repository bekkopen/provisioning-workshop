#!/bin/bash

sudo yum -y install salt-minion
sudo chkconfig salt-minion on
sudo mv /vagrant/files/minion /etc/salt/minion
sudo service salt-minion start

sudo ssh 10.11.12.15 sudo /usr/bin/salt-key -A && echo Keys: && sudo /usr/bin/salt-key -L && echo Ping && sudo /usr/bin/salt '*' test.ping
