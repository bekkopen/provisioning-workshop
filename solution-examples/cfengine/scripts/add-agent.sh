#!/bin/bash

sudo /var/cfengine/bin/cf-agent --bootstrap 10.11.12.13 && echo "Policyserver set successfully!" || echo "Setting policyserver failed!"
