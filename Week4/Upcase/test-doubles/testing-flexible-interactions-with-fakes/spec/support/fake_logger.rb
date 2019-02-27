class Fake_logger
  def initialize
    @messages = {
      debug: [],
      fatal: [],
      error: []
    }
  end
  attr_reader :messages
  def debug(message)
    @messages[:debug] << message
  end

  def fatal(message)
    @messages[:fatal] << message
  end

  def error(message)
    @messages[:error] << message
  end
end
