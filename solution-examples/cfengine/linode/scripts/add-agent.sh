#!/bin/bash

/var/cfengine/bin/cf-agent --bootstrap policyserver.devops.smat.cc && echo "Policyserver set successfully!" || echo "Setting policyserver failed!"
