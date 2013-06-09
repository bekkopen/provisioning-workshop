provisioning-workshop
=====================

Provision this:
- An app user 'devops', with:
    * 'devops123' as password
    * a home directory
    * /bin/bash as the default shell
    * an [init script](https://github.com/bekkopen/provisioning-workshop/blob/master/serverfiler/devops)
- nginx with a reverse proxy using the [example configuration](https://github.com/bekkopen/provisioning-workshop/blob/master/serverfiler/etc/nginx/conf.d/devops.conf)
