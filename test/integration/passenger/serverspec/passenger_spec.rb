require 'spec_helper'
describe 'my_web_server_cookbook::passenger' do

  describe command('gem list') do
    its(:stdout) { should match /passenger/ }
  end

  describe package('apache2-dev') do
    it { should be_installed }
  end

  describe package('ruby-dev') do
    it { should be_installed }
  end

  describe package('libapr1-dev') do
    it { should be_installed }
  end

  describe package('libaprutil1-dev') do
    it { should be_installed }
  end

  describe file('/var/lib/gems/1.9.1/gems/passenger-5.0.5/buildout/apache2/mod_passenger.so') do
    it { should be_file }
  end

  describe file('/etc/apache2/apache2.conf') do
    it { should be_file }
    its(:content) { should match /LoadModule passenger_module/ }
  end
end
