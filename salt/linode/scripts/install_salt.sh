#!/bin/bash

yum -y upgrade python
rpm -q epel-release || rpm -Uvh http://ftp.linux.ncsu.edu/pub/epel/6/i386/epel-release-6-8.noarch.rpm

