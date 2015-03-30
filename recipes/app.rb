#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::default'
include_recipe 'my_web_server_cookbook::user'
#include_recipe 'my_web_server_cookbook::passenger'

execute 'change owner and group' do
  command "sudo chown deploy:deploy /var/www"
  action :run
end

# Write out "my_app" as a virtual to etc/apache2/sites-available
# template resource - also notify apache2 to restart
# symlink from sites available back to sites enabled
# have another link resource that says that 000-default - link does not exist (according to policy) - should also have a notifies to tell apache2 to restart or reload
template '/etc/apache2/apache2.conf' do
  source 'app-apache2.conf.erb'
end

service 'apache2' do
  action [:restart]
end
