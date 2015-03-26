#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::default'
include_recipe 'my_web_server_cookbook::user'

execute 'change owner and group' do
  command "sudo chown deploy:deploy /var/www"
  action :run
end

template '/etc/apache2/apache2.conf' do
  source 'app-apache2.conf.erb'
end
