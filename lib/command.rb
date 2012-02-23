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

require "rubygems"
require "ncurses"

# Base class for concrete commands implementations.
# Each command supports two interfaces, one for
# command line and one for Ncurses.
# You may need to overwrite the class methods for convenience.
# Each command may need to contemplate how the result is
# going to be output, options could be:
#
#   STDOUT in plain/formated text.
#   STDOUT in structured format like JSON.
#   Object or hash returned by the run() method.

class GecosUpdater::Command

  # Entry point for command line interface.
  #   subcommand: The task this class may perform.
  #   options: A hash containing specific modifiers.
  def run(subcommand, options)
    @options = options
    begin
      method_name = "action_#{subcommand}"
      self.method(method_name).call()
    rescue Exception => e
      p e
    end
  end

  def output_plain(format, text)
    puts "#{text}\n" if format == "plain"
  end

  def output_json(format, json)
    puts "#{json.to_s}\n" if format == "json"
  end

  def curses_options
    return []
  end

  def curses_show_menu
  end

  def curses_wait_input(quit_char)
    opt = nil
    until opt == quit_char
      opt = Ncurses.getch.chr
      id = opt.to_i - 1
      if id >= 0 and curses_options[id] != nil
        opt = curses_call_option(curses_options[id])
        curses_show_menu
      end
    end
    opt
  end

  def curses_call_option(option)
  end

end
