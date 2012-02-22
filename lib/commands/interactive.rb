
class GecosUpdater::Interactive < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Interactive command:"
    p subcommand
    p options
  end

end
