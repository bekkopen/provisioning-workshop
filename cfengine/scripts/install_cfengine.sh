#!/bin/bash

sudo yum -y install db4 pcre openssl && echo "Installed db4 pcre openssl successfully" || echo "Installation of db4 pcre openssl failed!"
cd /var
sudo rpm -ivh /vagrant/packages/cfengine-community-3.5.1-3.x86_64.rpm && echo "CfEngine installed successfully!" || echo "Installation of cfengine failed!"

