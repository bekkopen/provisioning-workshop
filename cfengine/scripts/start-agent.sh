#!/bin/bash

cd /var/cfengine
sudo /var/cfengine/bin/cf-key
sudo /var/cfengine/bin/cf-agent --bootstrap 10.11.12.13 && echo "Policyserver set successfully!" || echo "Setting policyserver failed!"

