
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
    Ncurses.addstr("GECOS-Updater :: Update packages")
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
