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

class GecosUpdater::Select < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Select command:"
    repopath = options[:repo]
    @packages = parse_packages_file(repopath)
    @updatable = check_available_updates
    @selected = {}
    super subcommand, options
  end

  def action_list
    puts "List of available packages\n" if @options[:list_all] == true
    puts "List of updatable packages\n" if @options[:list_upd] == true
    puts "List of selected packages\n" if @options[:list_sel] == true
  end

  def action_use
    puts "List of selected packages\n"
  end
  
  def parse_packages_file(repopath)
    return {}
  end

  def check_available_updates
  end

end
