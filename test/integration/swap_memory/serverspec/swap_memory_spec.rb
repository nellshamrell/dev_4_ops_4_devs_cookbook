require 'spec_helper'
describe 'my_web_server_cookbook::swap_memory' do
  
  describe command('swapon -s') do
    its(:stdout) { should match /\/swap\s+file\s/ }
  end
 
end

