
class GecosUpdater::Select < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Select command:"
    p subcommand
    p options
  end

end
