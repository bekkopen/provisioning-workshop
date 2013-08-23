#!/bin/bash

sudo mkdir -p ~vagrant/.ssh ~root/.ssh

while read line ;do
  grep -q $line ~vagrant/.ssh/authorized_keys 2> /dev/null && echo "Public key $line for vagrant user exists allready!\n" || echo $line >> ~vagrant/.ssh/authorized_keys
  grep -q $line ~root/.ssh/authorized_keys 2> /dev/null && echo "Public key $line for root user exists allready!\n" || echo $line >> ~root/.ssh/authorized_keys
done < /vagrant/ssh/authorized_keys

sudo cp /vagrant/ssh/master/id_rsa /vagrant/ssh/master/id_rsa.pub /vagrant/ssh/master/known_hosts ~vagrant/.ssh/ && echo "Copied ssh files for vagrant sucessfully!" || echo "Copying ssh files for vagrant failed!"
grep -q vagrant@localhost.localdomain ~vagrant/.ssh/authorized_keys 2> /dev/null && echo "Public key for vagrant minion exists allready!" || sudo cat /vagrant/ssh/minion/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
echo "Installed .ssh files for vagrant master!"

sudo cp /vagrant/ssh/master/id_rsa /vagrant/ssh/master/id_rsa.pub /vagrant/ssh/master/known_hosts ~root/.ssh/ && echo "Copied ssh files for root sucessfully!" || echo "Copying ssh files failed!"
grep -q vagrant@localhost.localdomain ~root/.ssh/authorized_keys 2> /dev/null && echo "Public key for root minion exists allready!" || sudo cat /vagrant/ssh/minion/id_rsa.pub >> ~root/.ssh/authorized_keys
echo "Installed .ssh files for root master!"

