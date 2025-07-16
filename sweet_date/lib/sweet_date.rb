require_relative "sweet_date/version"
require_relative "sweet_date/authorize"
require_relative "sweet_date/api"
require_relative "sweet_date/ping"
require_relative "sweet_date/tier"
require_relative "sweet_date/tiers"

module SweetDate
  class Error < StandardError; end

  class << self
    attr_accessor :config

    def configure
      self.config ||= Configuration.new
      yield(config)
    end

    def api = @api ||= API.new
    def ping = Ping.call
    def list_tiers = Tier.list
    def get_tier(id) = Tier.get(id)
    def create_tier(name) = Tier.create(name)
  end

  class Configuration
    attr_accessor :api_key_id, :api_secret, :host, :port
  end
end