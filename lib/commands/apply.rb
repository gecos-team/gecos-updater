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

class GecosUpdater::Apply < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Apply command:"
    p subcommand
    p options
  end

  def curses_options
    options = [
      {:id => "1", :command => "update", :text => "alkjsdhf"},
      {:id => "2", :command => "update", :text => "hjas  sdahj"}
    ]
  end

  def curses_show_menu
    Ncurses.stdscr.clear()
    Ncurses.move(2, 2)
    Ncurses.addstr("GECOS-Updater :: Apply changes")
    Ncurses.refresh

    row = 5
    curses_options.each do |opt|
      Ncurses.move(row, 5)
      Ncurses.addstr("#{opt[:id]}. #{opt[:text]}")
      Ncurses.refresh
      row = row + 1
    end

    Ncurses.move(row + 2, 2)
    Ncurses.addstr("Select an option (press ESC to cancel): ")
    Ncurses.refresh
  end

  def curses_call_option(option)
    p option
  end

end
