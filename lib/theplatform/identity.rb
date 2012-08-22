module ThePlatform

  # Class to RESTfully interface with thePlatform's Identity API
  #    ThePlatform::Identity#
  class Identity
    include HTTParty
    extend ThePlatform::Configuration

    # username: and password: are required to build a new Identity object.  duration: and timeout: can be added
    # but if they are missing from the params, it will default to thePlatforms default values.
    def initialize(params = {})
      @username = params[:username]
      @password = params[:password]
      @duration = params[:_duration]
      @timeout  = params[:_idleTimeout]
    end

    # Set the different available params to configure
    def self.keys
      @keys ||= [:schema, :form, :username, :password, :_duration, :_idleTimeout]
    end

    # Return ALL THE TOKEN!
    #
    # ThePlatform::Identity.new(username:'USERNAME', password:'PASSWORD').token(schema:'1.0', form:'(json|xml|rss)')
    #
    # duration: and timeout: are optional.  Resorts to thePlatform defaults if not defined
    def token(options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signIn", query: options.merge(ThePlatform::Identity.parameters))
    end

    # Invalidate a given Token
    #
    # ThePlatform::Identity.new.invalidate!(token, schema:'1.0', form:'(json|xml|rss)')
    def invalidate!(tokens, options = {})
      self.class.base_uri IDENTITY
      self.class.get("/signOut?_token=#{tokens}", query: options.merge(ThePlatform::Identity.parameters))
    end

    # Return the number of tokens in an account.
    #
    # ThePlatform::Identity.new(username:'USERNAME', password:'PASSWORD').count(schema:'1.0', form:'(json|xml|rss)')
    def count(options = {})
      self.class.base_uri IDENTITY
      self.class.get("/getTokenCount", query: options.merge(ThePlatform::Identity.parameters))
    end

  end

end
