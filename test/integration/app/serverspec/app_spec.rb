require 'spec_helper'
describe 'my_web_server_cookbook::app' do
  describe file('/var/www') do
    it { should be_owned_by 'deploy' }
  end

  describe file('/var/www') do
    it { should be_grouped_into 'deploy' }
  end

  describe file('/etc/apache2/apache2.conf') do
    its(:content) { should match /<VirtualHost \*:80>/ }
    its(:content) { should match /123\.456\.78\.90/ }
  end

  describe command('passenger-memory-stats') do
    its(:stdout) { should match /PassengerAgent watchdog/ }
    its(:stdout) { should match /PassengerAgent server/ }
    its(:stdout) { should match /PassengerAgent logger/ }
  end
end
