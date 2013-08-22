#!/bin/bash

sudo mkdir ~/.ssh
sudo cp /vagrant/ssh/minion/id_rsa /vagrant/ssh/minion/id_rsa.pub /vagrant/ssh/minion/known_hosts ~/.ssh/ && echo "Copied ssh files sucessfully!" || echo "Copying ssh files failed!"
grep -q vagrant@localhost.localdomain ~/.ssh/authorized_keys 2> /dev/null && echo "Public key exists allready!" || sudo cat /vagrant/ssh/master/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod 700 ~/.ssh
sudo chmod 644 ~/.ssh/id_rsa.pub ~/.ssh/known_hosts
sudo chmod 600 ~/.ssh/id_rsa ~/.ssh/authorized_keys
echo "Installed .ssh files!"

