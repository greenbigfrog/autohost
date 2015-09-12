require 'cinch'

module Cinch
  module Plugins
    class Autohost
      include Cinch::Plugin

      match "*"
      def execute(m)
        m.reply '.host devwars'
      end
    end
  end
end
