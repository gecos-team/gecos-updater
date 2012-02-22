
require "optparse"


class GecosUpdater

  def self.get_default_options
    options = {
      :help => false,
      :interactive => false,
      :confpath => "/etc/gecos-updater.conf",
      :repo => ""
    }
  end

  def self.run

    options = get_default_options

    commands = ARGV.options do |opts|
      opts.banner = "Usage: gecos_updater.rb [command] [subcommand] [options]"
 
      opts.on("-h", "--help", "Show help and exit.") do |h|
        options[:help] = h
      end
 
      opts.on("-i", "--interactive", "Enter in interactive mode.") do |i|
        options[:interactive] = i
      end

      opts.on("-c", "--confpath PATH", "Path to the config file, defaults to /etc/gecos-updater/conf.rb") do |c|
        options[:confpath] = c
      end
 
      opts.on("-r", "--repo URL", "URL of the remote repository.") do |r|
        options[:repo] = r
      end
 
      opts.on("-f", "--foo ARG", "URL of the remote repository.") do |f|
        options[:foo] = f
      end
  
    end.parse!

    command, subcommand = commands[0], commands[1]
    command = 'help' if options[:help] == true
    command = 'interactive' if command.nil? or options[:interactive] == true

    instance = get_command_instance(command)
    instance = get_command_instance("help") if instance.nil?
    instance.run subcommand, options if instance != nil
  end

  def self.get_command_instance(command)
    command_path = "./lib/commands/#{command}.rb"
    if File.exists?(command_path)
      require "./lib/commands/#{command}"
      instance = GecosUpdater::const_get(command.capitalize).new
    end
  end

end
