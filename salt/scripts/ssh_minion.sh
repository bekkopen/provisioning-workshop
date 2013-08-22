#!/bin/bash

sudo mkdir -p ~vagrant/.ssh ~root/.ssh

sudo cp /vagrant/ssh/minion/id_rsa /vagrant/ssh/minion/id_rsa.pub /vagrant/ssh/minion/known_hosts ~vagrant/.ssh/ && echo "Copied ssh files for vagrant sucessfully!" || echo "Copying ssh files for vagrant failed!"
grep -q vagrant@localhost.localdomain ~vagrant/.ssh/authorized_keys 2> /dev/null && echo "Public key for vagrant master exists allready!" || sudo cat /vagrant/ssh/master/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
echo "Installed .ssh files for vagrant minion!"

sudo cp /vagrant/ssh/minion/id_rsa /vagrant/ssh/minion/id_rsa.pub /vagrant/ssh/minion/known_hosts ~root/.ssh/ && echo "Copied ssh files for root sucessfully!" || echo "Copying ssh files failed!"
grep -q vagrant@localhost.localdomain ~root/.ssh/authorized_keys 2> /dev/null && echo "Public key for root master exists allready!" || sudo cat /vagrant/ssh/master/id_rsa.pub >> ~root/.ssh/authorized_keys
echo "Installed .ssh files for root minion!"

