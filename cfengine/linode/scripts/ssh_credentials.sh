#!/bin/bash

touch ~root/.ssh/known_hosts
chmod 700 ~root/.ssh
chmod 644 ~root/.ssh/id_rsa.pub ~root/.ssh/known_hosts
chmod 600 ~root/.ssh/id_rsa ~root/.ssh/authorized_keys
