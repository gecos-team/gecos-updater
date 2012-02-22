
class GecosUpdater::Help < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Help command:"
    p subcommand
    p options
  end

end
