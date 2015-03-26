require 'spec_helper'

describe 'my_web_server_cookbook::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe command('ls -l /var/lib/apt/periodic/update-success-stamp') do
    its(:stdout) { should match /#{Regexp.quote(Date.today.strftime("%b %d"))}/}
  end
  
  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_running }

    it { should be_enabled }
  end

  describe file('/var/www/html/index.html') do
    its(:content) { should match /<h1>I AM A CUSTOM PAGE<\/h1>/ }
  end
end
