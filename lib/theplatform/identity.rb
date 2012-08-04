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
    def token(options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signIn?username=#{@username}&password=#{@password}", query: options)
    end

    # Invalidate a given Token
    def invalidate!(tokens, options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signOut?_token=#{tokens}", query: options)
    end

    def count(options)
      self.class.base_uri IDENTITY
      self.class.get("/getTokenCount?username=#{@username}&password=#{@password}", query: options)
    end

  end

end
