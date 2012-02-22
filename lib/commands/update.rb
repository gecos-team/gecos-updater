
class GecosUpdater::Update < GecosUpdater::Command

  def run(subcommand, options)
    puts "running Update command:"
    p subcommand
    p options
  end

end
