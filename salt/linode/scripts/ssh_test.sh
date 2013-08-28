#!/bin/bash

ssh -tt -o StrictHostKeyChecking=no master && exit
ssh -tt -o StrictHostKeyChecking=no salt && exit
exit
