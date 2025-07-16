require "socket"
require "json"

module SweetDate
  class API
    def initialize
      @host = SweetDate.config.host
      @port = SweetDate.config.port
    end

    def call(cmd, payload)
      message = "#{cmd}|#{JSON.generate(payload)}\n"

      socket = TCPSocket.new(@host, @port)
      socket.puts message

      response = socket.gets&.strip
      socket.close
      puts response

      parsed = JSON.parse(response)
      parsed.is_a?(String) ? JSON.parse(parsed) : parsed
      
    rescue => e
      { "status" => "error", "message" => e.message }
    end
  end
end