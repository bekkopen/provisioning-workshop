#
# Cookbook Name:: aliases
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
magic_shell_alias 'h' do
  command 'cd ~'
end

magic_shell_alias 'sites' do
  command "cd #{node['apache']['dir']}/sites-enabled"
end
