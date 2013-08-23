#!/bin/bash

grep -q salt /etc/hosts 2> /dev/null && echo "The salt server is already in /etc/hosts" || sudo echo "10.11.12.15   salt" >> /etc/hosts
echo "Added salt to /etc/hosts"

