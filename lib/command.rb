
require "rubygems"
require "ncurses"

class GecosUpdater::Command

  def run(subcommand, options)
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
