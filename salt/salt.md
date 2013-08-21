Salt
====

Install:
--------

http://docs.saltstack.com/topics/installation/rhel.html

* Install packages
* Start services

Configuration:
--------------

http://docs.saltstack.com/topics/configuration.html

* Configure the minion with the IP of the master
* Accept the minions key on the master ```salt-key -A```

Pros:
-----

* Succinct and readable syntax (YAML based).
* Supports both push and pull remote execution.
* Easy to install / low startup costs.
* Support for various cloud providers (EC2, linode, Rackspace, etc.) with boostrapping for some through [Cloud-Init](http://docs.saltstack.com/topics/tutorials/bootstrap_ec2.html).
* Much more declarative than other frameworks.

Cons:
-----

* Much more declarative than other frameworks. Yes both a pro and con. :)
* As it uses YAML it is hard to create well-defined interfaces to modules (if the need arises). No concept of parameters to modules as in Puppet. Not a problem for simple infrastructures (i.e. such as that explored by the workshop).

Other facts:
------------

* Apache License, Version 2.0

