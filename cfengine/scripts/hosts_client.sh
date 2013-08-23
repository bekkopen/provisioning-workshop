#!/bin/bash

grep -q policy /etc/hosts 2> /dev/null && echo "The policy server is already in /etc/hosts" || sudo echo "10.11.12.15   policy" >> /etc/hosts
echo "Added policy to /etc/hosts"

