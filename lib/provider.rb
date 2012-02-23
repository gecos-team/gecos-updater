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

class GecosUpdater::Provider

  def run(action, *options)
    @options = options
    begin
      method_name = "action_#{action}"
      self.method(method_name).call()
    rescue Exception => e
      p e
    end
  end

end
