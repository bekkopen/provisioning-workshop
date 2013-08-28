#!/bin/bash

ssh -tt -o StrictHostKeyChecking=no policyserver && exit
ssh -tt -o StrictHostKeyChecking=no cfengine && exit
exit
