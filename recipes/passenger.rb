#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: passenger
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::ruby'

execute 'sudo gem install passenger' do
  command "sudo gem install passenger"
  action :run
end

package 'apache2-dev'

package 'ruby-dev'

package 'libapr1-dev'

package 'libaprutil1-dev'

execute 'create swap file' do
  command "sudo dd if=/dev/zero of=/swap bs=1M count=1024"
  action :run
  not_if { ::File.exists?("/swap")}
end

execute 'create a linux swap area' do
  command "sudo mkswap /swap"
  action :run
end

execute 'activate the swap file' do
  command "sudo swapon /swap"
  action :run
  not_if 'swapon -s | grep swap'
end

execute 'passenger-install-apache2-module' do
  command "sudo passenger-install-apache2-module --auto"
  action :run
end

template '/etc/apache2/apache2.conf' do
  source 'passenger-apache2.conf.erb'
end
