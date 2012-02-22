
class GecosUpdater::Restore < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Restore command:"
    p subcommand
    p options
  end

end
