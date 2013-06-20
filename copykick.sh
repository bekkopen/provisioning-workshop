#/bin/bash

scp -r puppet/* root@178.79.160.213:/etc/puppetlabs/puppet/


ssh root@176.58.109.121 "cat /var/run/pe-puppet/agent.pid | xargs kill -s SIGUSR1"
ssh root@178.79.160.213 "cat /var/run/pe-puppet/agent.pid | xargs kill -s SIGUSR1"