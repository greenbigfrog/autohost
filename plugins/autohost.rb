require 'cinch'
require 'net/http'
require 'uri'

module Cinch
  module Plugins
    class Autohost
      include Cinch::Plugin

      timer 60, method: :getlist

      match "*"
      def execute(m)
        m.reply '.host devwars'
      end

      def getlist
        uri = URI.parse("https://gist.githubusercontent.com/green-big-frog/55c0737a8b1b68e9501a/raw/")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)

        response = http.request(request)
        puts "successfully got the host list from github gist\n"

        target = open('host', 'w')
        target.write(response.body)
        target.close
      end
    end
  end
end
