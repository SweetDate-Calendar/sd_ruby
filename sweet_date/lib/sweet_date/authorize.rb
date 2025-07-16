module SweetDate
  class Authorize
    def self.payload(attrs = {})
      attrs.merge(
        "sweet_date_account_id" => SweetDate.config.api_key_id,
        "access_key" => SweetDate.config.api_secret
      )
    end
  end
end