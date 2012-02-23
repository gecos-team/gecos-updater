# This file is part of Guadalinex GECOS
#
# This software is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this package; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
# 
# Author:: Antonio Hernández <ahernandez@emergya.com>

require "optparse"


class GecosUpdater

  def self.get_default_options
    options = {
      :help => false,
      :interactive => false,
      :confpath => "/etc/gecos-updater.conf",
      :repo => "",
      :format => "plain",
      :list_all => false,
      :list_upd => true,
      :list_sel => false
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
 
      opts.on("", "--all", "List all the avaiable packages.") do |l|
        options[:list_all] = l
        options[:list_upd] = false
        options[:list_sel] = false
      end
 
      opts.on("", "--updatable", "List all the updatable packages.") do |l|
        options[:list_all] = false
        options[:list_upd] = l
        options[:list_sel] = false
      end
 
      opts.on("", "--selected", "List all packages selected for update.") do |l|
        options[:list_all] = false
        options[:list_upd] = false
        options[:list_sel] = l
      end
  
    end.parse!

    # Read the configuratino file and merge the default options
    # and the ones specified by command line.
    options = self.read_conf(options)

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

  def self.read_conf(options)
    confpath = options[:confpath]
    # TODO: Check the file exits, parse it, and
    # merge the values with the option hash.
    return options
  end

end
