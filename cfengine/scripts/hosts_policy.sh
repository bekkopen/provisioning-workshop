#!/bin/bash

grep -q client /etc/hosts 2> /dev/null && echo "The client server is already in /etc/hosts" || sudo echo "10.11.12.14   client" >> /etc/hosts
echo "Added client to /etc/hosts"

