#!/bin/bash

grep -q cfengine /etc/hosts 2> /dev/null && echo "The cfengine server is already in /etc/hosts" || echo "178.79.163.71   cfengine" >> /etc/hosts
echo "Added cfengine to /etc/hosts"
grep -q policyserver /etc/hosts 2> /dev/null && echo "The policyserver server is already in /etc/hosts" || echo "176.58.98.241   policyserver" >> /etc/hosts
echo "Added policyserver to /etc/hosts"
