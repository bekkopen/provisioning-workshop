#
# Cookbook Name:: bekk-devops
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "devops" do
  supports :manage_home => true 
  system true
  home "/home/devops"
  shell "/bin/bash"
  password "$1$cgoRmMec$Ge8EgZkjjwvKfOkcOAn7a1"
  action :create
end

cookbook_file "/home/devops/devops.jar"
  source "devops.jar"
  mode 0755
  action :create
end


cookbook_file "/tmp/devops" do
  source "devops"
  mode 0755
  action :create
end

execute "run-devops-init-script" do
  command "sh /tmp/devops"
end



