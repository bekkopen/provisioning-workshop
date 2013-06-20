#
# Cookbook Name:: mysetup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

file "/etc/nginx/conf.d/devops.conf" do
  content
  mode "644"
  action :create
end 

