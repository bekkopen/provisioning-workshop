# provisioning-workshop

This repo contains a set of files that can be used as an example on how you provition a server. The following things can be found in the folder `files_for_tasks`:

- A sample java application is provided, containing a minimal setup of jetty and jersey. When started on a server, it responds to port 1234 with a simple "I'm alive"-response. 
- A startup script for this java-application that can be placed in `/etc/init.d`.
- An example configuration for nginx, making it reverse proxy all requests on port 80 to port 1234.

## The main task

The primary task of the workshop is to set up a server containing these things. This can be solved in a lot of different ways, but the following are a suggested approach:

- An app user 'devops', with:
    * 'devops123' as password
    * a home directory
    * /bin/bash as the default shell
- java
- nginx
- the java init script in /etc/init.d
- nginx config using the example configuration

## Solutions (just suggestions)

This workshop has been held a few times, and we have therefore collected quite a few suggested solutions. These can be found in the folder `solution-examples`. There we have working setups for ansible, cfengine, chef, puppet and salt.

## Presentation

Also included in this repo is a presentation summarizing what provisioning means and also a comparison of the following frameworks: ansible, cfengine, chef, puppet and salt.