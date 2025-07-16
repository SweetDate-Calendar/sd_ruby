module SweetDate
  class Ping
    def self.call
      payload = Authorize.payload
      SweetDate.api.call("PING", payload)
    end
  end
end