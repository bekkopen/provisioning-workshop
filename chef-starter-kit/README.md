Chef Repository
===============
All Chef installations require a central "workspace" - we call this the **Chef Repository**. This is a place where Chef primitive objects like cookbooks, roles, and data bags, are stored and managed. As such, we highly recommend keeping this repository under version control such as [git](http://git-scm.org), and treat it like source code.

Knife Configuration
-------------------
"Knife" is the CLI (commonad line interface) to Chef. Inside the `.chef` directory of this project (you may need to show hidden files and folders to see it), you will find a `knife.rb`. This file holds configuration and settings for your project.

The `knife.rb` has been automatically created and customized for you. However, you may want to add additional configuration such as [cloud provider options](http://docs.opscode.com/plugin_knife.html) or [knife plugins](http://docs.opscode.com/plugin_knife_custom.html).

Also inside the `.chef` directory you will see two `.pem` files. These are private keys are used to authenticate your requests to the Chef Server. Your `USERNAME.pem` file is private and should never be shared. However your `ORGANIZATION-validator.pem` is global for your Enterprise Chef Organization, and other Chef developers may require it. More information about `knife.rb` configuration options can be found in [the documentation for knife](http://docs.opscode.com/config_rb_knife.html).

Cookbooks
---------
A cookbook is the Chef primitive for telling a machine how to behave. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to your Chef Server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

Roles
-----
Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

Getting Started with Chef
-------------------------
Now that you have your Chef Repository ready to go, check out [Learn Chef](https://learnchef.opscode.com/quickstart/workstation-setup/) to proceed with your workstation setup. If you have any questions about Enterprise Chef you can always ask [our support team](https://www.opscode.com/support/tickets/new) for a helping hand.
