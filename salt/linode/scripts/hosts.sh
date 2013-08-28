#!/bin/bash

grep -q salt /etc/hosts 2> /dev/null && echo "The salt server is already in /etc/hosts" || echo "178.79.152.151   salt" >> /etc/hosts
echo "Added cfengine to /etc/hosts"
grep -q master /etc/hosts 2> /dev/null && echo "The master server is already in /etc/hosts" || echo "151.236.216.254   master" >> /etc/hosts
echo "Added master to /etc/hosts"
