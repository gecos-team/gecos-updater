
class GecosUpdater::Backup < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Backup command:"
    p subcommand
    p options
  end

end
