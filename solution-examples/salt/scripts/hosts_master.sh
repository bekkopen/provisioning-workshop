#!/bin/bash

grep -q minion /etc/hosts 2> /dev/null && echo "The minion server is already in /etc/hosts" || sudo echo "10.11.12.16   minion" >> /etc/hosts
echo "Added minion to /etc/hosts"

