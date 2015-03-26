require 'spec_helper'
describe 'my_web_server_cookbook::postgresql' do
  describe package('postgresql') do
    it { should be_installed }
  end

  describe user('postgres') do
    it { should exist }
  end

  describe command('sudo -u postgres -s psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname=\'deploy\'"') do
    its(:stdout) { should match /1/ }
  end

  describe command('sudo -u postgres -s psql postgres -tAc "\du"') do
    its(:stdout) { should match /deploy\|Create DB\|{}/ }
  end
end
