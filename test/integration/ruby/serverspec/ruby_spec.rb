require 'spec_helper'
describe 'my_web_server_cookbook::ruby' do
  describe package('ruby') do
    it { should be_installed }
  end

  describe package('git-core') do
    it { should be_installed }
  end

  describe package('curl') do
    it { should be_installed }
  end

  describe package('zlib1g-dev') do
    it { should be_installed }
  end

  describe package('build-essential') do
    it { should be_installed }
  end

  describe package('libssl-dev') do
    it { should be_installed }
  end

  describe package('libreadline-dev') do
    it { should be_installed }
  end

  describe package('libyaml-dev') do
    it { should be_installed }
  end

  describe package('libsqlite3-dev') do
    it { should be_installed }
  end

  describe package('libxml2-dev') do
    it { should be_installed }
  end

  describe package('libxslt1-dev') do
    it { should be_installed }
  end

  describe package('libcurl4-openssl-dev') do
    it { should be_installed }
  end

  describe package('python-software-properties') do
    it { should be_installed }
  end

  describe command('bash -l -c "rvm list"') do
    its(:stdout) { should match /ruby-2.1.3/ }
  end
end
