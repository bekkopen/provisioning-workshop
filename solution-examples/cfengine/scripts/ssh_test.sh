#!/bin/bash

ssh -tt -o StrictHostKeyChecking=no policyserver && exit
ssh -tt -o StrictHostKeyChecking=no client && exit
sudo su -
ssh -tt -o StrictHostKeyChecking=no policyserver && exit
ssh -tt -o StrictHostKeyChecking=no client && exit
exit
