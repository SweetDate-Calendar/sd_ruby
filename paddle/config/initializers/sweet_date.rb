SweetDate.configure do |config|
  config.api_key_id = ENV.fetch("SWEETDATE_API_KEY_ID")
  config.api_secret = ENV.fetch("SWEETDATE_API_SECRET")
  config.host = ENV.fetch("SWEETDATE_HOST", "localhost")
  config.port = ENV.fetch("SWEETDATE_PORT", 4000).to_i
end