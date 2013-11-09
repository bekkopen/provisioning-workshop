#!/bin/bash

yum -y install db4 pcre openssl && echo "Installed db4 pcre openssl successfully" || echo "Installation of db4 pcre openssl failed!"
rpm -q cfengine-community || rpm -ivh ~/files/cfengine-community-3.5.1-3.x86_64.rpm

