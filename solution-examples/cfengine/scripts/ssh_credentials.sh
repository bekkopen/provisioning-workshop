#!/bin/bash

sudo touch ~root/.ssh/known_hosts ~vagrant/.ssh/known_hosts
sudo chown -R vagrant:vagrant ~vagrant/.ssh
sudo chmod 700 ~vagrant/.ssh ~root/.ssh
sudo chmod 644 ~vagrant/.ssh/id_rsa.pub ~root/.ssh/id_rsa.pub ~root/.ssh/known_hosts ~vagrant/.ssh/known_hosts
sudo chmod 600 ~vagrant/.ssh/id_rsa ~vagrant/.ssh/authorized_keys ~root/.ssh/id_rsa ~root/.ssh/authorized_keys
