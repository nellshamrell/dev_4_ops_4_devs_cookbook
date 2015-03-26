#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute 'add deploy user' do
  command "sudo adduser deploy"
  action :run
  not_if "grep deploy /etc/passwd", :user => "deploy"
end

execute 'add deploy user' do
  command "sudo adduser deploy sudo"
  action :run
end

template '/etc/sudoers.d/deploy' do
  source 'deploy.erb'
end

execute 'create .ssh directory' do
  command "sudo mkdir /home/deploy/.ssh"
  action :run
  not_if { ::File.exists?("/home/deploy/.ssh")}
end

template '/home/deploy/.ssh/authorized_keys' do
  source 'ssh_key.erb'
end
