require 'cinch'

require 'configatron'
require './config.rb'

Dir["./plugins/*.rb"].each { |file| require file }

bot = Cinch::Bot.new do
  file = open("/tmp/autohost.log", "a")
  file.sync = true
  loggers.push(Cinch::Logger::FormattedLogger.new(file))
  loggers.first.level = :debug

  configure do |c|
    c.nick = configatron.nick
    c.server = configatron.server
    c.port = "6667"
    c.password = configatron.password
    c.channels = configatron.channels
    c.messages_per_second = 0.2
    c.plugins.plugins = [
      Cinch::Plugins::Autohost
    ]
  end
end

bot.start
