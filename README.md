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
---------------
Go to serverspec/ directory and add this line to your application's Gemfile:

```ruby
gem 'serverspec'
```

And then execute:
---------------
```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install serverspec
```

Getting Started:
---------------
```bash
$ serverspec-init
```

Select a backend type:
---------------
```bash
  1) SSH
  2) Exec (local)

Select number: 1
```

Run it:
---------------
```bash
$ rake spec
```
