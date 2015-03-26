#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: ruby
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'my_web_server_cookbook::default'

package 'ruby'

package 'git-core'

package 'curl'

package 'zlib1g-dev'

package 'build-essential'

package 'libssl-dev'

package 'libreadline-dev'

package 'libyaml-dev'

package 'libsqlite3-dev'

package 'sqlite3'

package 'libxml2-dev'

package 'libxslt1-dev'

package 'libcurl4-openssl-dev'

package 'python-software-properties'

include_recipe 'rvm::system_install'

rvm_ruby "ruby-2.1.3" do
  action :install
end
