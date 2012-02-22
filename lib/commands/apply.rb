
class GecosUpdater::Apply < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Apply command:"
    p subcommand
    p options
  end

end
