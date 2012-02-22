
require 'chef/application'
require 'chef/knife'

class Gecos
  class Gecos::Knife < Chef::Application
 
    def run
  
      #ARGV = ['cookbook', 'list']
      #p ARGV
  
      #knife = Chef::Application::Knife.new
      #knife.run
      #super

      p self.parse_options
      p self.opt_parser.parse
      p options

      Chef::Knife.run(['cookbook', 'list'], {})
  
    end
  end
end

#g = Gecos::Knife.new
#g.run

