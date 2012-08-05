module ThePlatform

  class Identity
    include HTTParty

    def initialize(params = {})
      @username = params[:username]
      @password = params[:password]
      @duration = params[:duration]
      @timeout  = params[:timeout]
    end

    # Return ALL THE TOKEN!
    # ThePlatform::Identity.new(username:'USERNAME', password:'PASSWORD').token(schema:'1.0', form:'(json|xml|rss)')
    # duration: and timeout: are optional.  Resort to thePlatform defaults if not defined
    def token(options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signIn?username=#{@username}&password=#{@password}", query: options)
    end

    # Invalidate a given Token
    # ThePlatform::Identity.new.invalidate!(token)
    def invalidate!(tokens, options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signOut?_token=#{tokens}", query: options)
    end

    # Return the number of tokens in an account.
    # ThePlatform::Identity.new(username:'USERNAME', password:'PASSWORD').count(schema:'1.0', form:'(json|xml|rss)')
    def count(options)
      self.class.base_uri IDENTITY
      self.class.get("/getTokenCount?username=#{@username}&password=#{@password}", query: options)
    end

  end

end
