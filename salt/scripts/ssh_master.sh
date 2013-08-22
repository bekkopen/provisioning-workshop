#!/bin/bash

sudo cp /vagrant/ssh/master/id_rsa /vagrant/ssh/master/id_rsa.pub /vagrant/ssh/master/known_hosts ~vagrant/.ssh/ && echo "Copied ssh files sucessfully!" || echo "Copying ssh files failed!"
grep -q vagrant@localhost.localdomain ~vagrant/.ssh/authorized_keys 2> /dev/null && echo "Public key exists allready!" || sudo cat /vagrant/ssh/minion/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
sudo chmod 700 ~vagrant/.ssh
sudo chmod 644 ~vagrant/.ssh/id_rsa.pub ~vagrant/.ssh/known_hosts
sudo chmod 600 ~vagrant/.ssh/id_rsa ~vagrant/.ssh/authorized_keys
echo "Installed .ssh files!"

