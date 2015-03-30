#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: passenger
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::ruby'

execute 'sudo gem install passenger' do
  command "sudo gem install passenger"
  action :run
#  not_if { 'gem list | grep passenger'}
end

package 'apache2-dev'

package 'ruby-dev'

package 'libapr1-dev'

package 'libaprutil1-dev'

execute 'passenger-install-apache2-module' do
  command "sudo passenger-install-apache2-module --auto"
  action :run
end

# Write out passenger bits into mods available
# Create a symlink from mods enabled that points to mods available
# use template and link resource
# In template resource, wants a to notify apache2 to restart
template '/etc/apache2/apache2.conf' do
  source 'passenger-apache2.conf.erb'
end
