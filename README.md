provisioning-workshop
=====================

Provision this:
- An app user 'devops', with:
    * 'devops123' as password
    * a home directory
    * /bin/bash as the default shell
    * an [init script](https://github.com/bekkopen/provisioning-workshop/blob/master/serverfiler/devops)
- nginx with a reverse proxy using the [example configuration](https://github.com/bekkopen/provisioning-workshop/blob/master/serverfiler/etc/nginx/conf.d/devops.conf)

Serverspec
===========
Installation:

Add this line to your application's Gemfile:

gem 'serverspec'

And then execute:

$ bundle

Or install it yourself as:

$ gem install serverspec

Getting Started:

$ serverspec-init

Select a backend type:

  1) SSH
  2) Exec (local)

Select number: 1

Run it:

$ cd serverspec
$ rake spec
