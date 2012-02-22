

class GecosUpdater::Interactive < GecosUpdater::Command

  def run(subcommand, options)
    Ncurses.initscr
    Ncurses.noecho
    curses_show_menu
    curses_wait_input "q"
    Ncurses.endwin
  end

  def curses_options
    options = [
      {:id => "1", :command => "update", :text => "Update packages list"},
      {:id => "2", :command => "select", :text => "Select packages"},
      {:id => "3", :command => "apply", :text => "Apply changes"},
      {:id => "4", :command => "backup", :text => "Make backups"},
      {:id => "5", :command => "restore", :text => "Restore backups"}
    ]
  end

  def curses_show_menu
    Ncurses.stdscr.clear()
    Ncurses.move(2, 2)
    Ncurses.addstr("GECOS-Updater")
    Ncurses.refresh

    row = 5
    curses_options.each do |opt|
      Ncurses.move(row, 5)
      Ncurses.addstr("#{opt[:id]}. #{opt[:text]}")
      Ncurses.refresh
      row = row + 1
    end

    Ncurses.move(row + 2, 2)
    Ncurses.addstr("Select an option (press q to quit): ")
    Ncurses.refresh
  end

  def curses_call_option(option)
    instance = GecosUpdater::get_command_instance option[:command]
    instance.curses_show_menu if instance != nil
    instance.curses_wait_input "\e"
  end

end
