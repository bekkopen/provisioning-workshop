#!/bin/bash

touch .ssh/known_hosts
chmod 550 ./
chmod 700 .ssh
chmod 644 .ssh/id_rsa.pub .ssh/known_hosts
chmod 600 .ssh/id_rsa .ssh/authorized_keys
