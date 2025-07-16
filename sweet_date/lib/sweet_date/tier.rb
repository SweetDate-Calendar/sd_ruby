module SweetDate
  class Tier
    def self.list()
      payload = Authorize.payload()
      SweetDate.api.call("TIERS.LIST", payload)
    end
    

    # Retrieves a specific tier from the SweetDate TCP server.
    # 
    # Example:
    #   SweetDate.get_tier("3157f986-e888-4f76-9867-d40e1c49a625")
    #
    # Returns the parsed response from the server, or an error hash.
    def self.get(id)
      payload = Authorize.payload({"id" => id})
      SweetDate.api.call("TIERS.GET", payload)
    end

    # Create a tier on the SweetDate TCP server 
    #
    # Example:
    #   SweetDate.create_tier("brand new tier")
    #
    # Returns the parsed response from the server, or an error hash.
    def self.create(name)
      payload = Authorize.payload({"name" => name})
      SweetDate.api.call("TIERS.CREATE", payload) 
    end
    
    def self.update(params)
      # TODO: implement TIERS.UPDATE
    end
    
    def self.delete(params)
      # TODO: implement TIERS.DELETE
    end
    
    def self.create_tier_user(params)
      # TODO: implement TIERS.CREATE_TIER_USER
    end
    
    def self.get_tier_user(params)
      # TODO: implement TIERS.GET_TIER_USER
    end
    
    def self.list_tier_users(params)
      # TODO: implement TIERS.LIST_TIER_USERS
    end
    
    def self.update_tier_user(params)
      # TODO: implement TIERS.UPDATE_TIER_USER
    end
    
    def self.delete_tier_user(params)
      # TODO: implement TIERS.DELETE_TIER_USER
    end
    
  end
end