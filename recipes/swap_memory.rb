#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: swap_memory
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

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

