#!/bin/bash

cd /var/cfengine
sudo rm -Rf masterfiles || echo "Unable to delete masterfiles!"
sudo cp -Rf /vagrant/masterfiles . && echo "Copied masterfiles successfully!" || echo "Could not copy masterfiles!"

