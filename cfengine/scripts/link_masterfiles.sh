#!/bin/bash

cd /var/cfengine
sudo rm -Rf masterfiles || echo "Unable to delete masterfiles!"
sudo ln -nsf /vagrant/masterfiles && echo "Linked masterfiles successfully!" || echo "Could not link masterfiles!"

