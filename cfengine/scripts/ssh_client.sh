#!/bin/bash



sudo mkdir -p ~vagrant/.ssh ~root/.ssh

sudo cp /vagrant/ssh/client/id_rsa /vagrant/ssh/client/id_rsa.pub /vagrant/ssh/client/known_hosts ~vagrant/.ssh/ && echo "Copied ssh files for vagrant sucessfully!" || echo "Copying ssh files for vagrant failed!"
grep -q vagrant@localhost.localdomain ~vagrant/.ssh/authorized_keys 2> /dev/null && echo "Public key for vagrant policy_server exists allready!" || sudo cat /vagrant/ssh/policy_server/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
echo "Installed .ssh files for vagrant client!"

sudo cp /vagrant/ssh/client/id_rsa /vagrant/ssh/client/id_rsa.pub /vagrant/ssh/client/known_hosts ~root/.ssh/ && echo "Copied ssh files for root sucessfully!" || echo "Copying ssh files failed!"
grep -q vagrant@localhost.localdomain ~root/.ssh/authorized_keys 2> /dev/null && echo "Public key for root policy_server exists allready!" || sudo cat /vagrant/ssh/policy_server/id_rsa.pub >> ~root/.ssh/authorized_keys
echo "Installed .ssh files for root client!"

