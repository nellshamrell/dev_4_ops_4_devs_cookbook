#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'apt_update' do
  command "apt-get update"
  action :run
end

package 'apache2'

service 'apache2' do
  action [:start, :enable]
end

template '/etc/apache2/apache2.conf' do
  source 'apache2.conf.erb'
end
