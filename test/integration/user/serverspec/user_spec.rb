require 'spec_helper'
describe 'my_web_server_cookbook::deploy_user' do
  describe command('cut -d: -f1 /etc/passwd') do
    its(:stdout) { should match /deploy/ }
  end

  describe command('getent group sudo') do
    its(:stdout) { should match /deploy/ }
  end

  describe command('cat /etc/sudoers.d/deploy') do
    its(:stdout) { should match /deploy ALL=\(ALL\) NOPASSWD:ALL/ }
  end

  describe file('/home/deploy/.ssh') do
    it { should be_directory }
  end

  describe file('/home/deploy/.ssh/authorized_keys') do
    it { should be_file }
    its(:content) { should match /ssh-rsa.+devops workshop key/ }
  end
end
