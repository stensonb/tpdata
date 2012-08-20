module ThePlatform

  class Data
    include HTTParty

    # FIXME
    class << self

      attr_accessor :schema, :form, :token

      def keys
        @keys ||= [
          :schema,
          :form,
          :token
          ]
      end

      # FIXME Chapter in Metaprogramming about moving ivals to methods!
      def configure
        yield self
        self
      end

      def parameters?
        parameters.values.all?
      end

    end

    def initialize(params={})
      @endpoint = params[:endpoint]
      @objects  = params[:objects]
    end

    (class << self; self; end).instance_eval do
      SERVICE.keys.each do |data|
        define_method(data) { self.new(endpoint: SERVICE[data][:endpoint], objects: SERVICE[data][:objects]) }
      end
    end

    # GET call for data Object.
    #
    # This is built by passing the Object, the comma delimited IDs, and the RESTful parameters.
    #
    # Needed paramters are: schema, form, and token
    #
    # ThePlatform::Data.mds.get('Category','1278889', schema:'1.4.0',form:'json',token:'12uZynnc2zHvVNDokvgG0mmK33yOOd')
    def get(object, id=[],options={})
      @options = options
      self.class.base_uri @endpoint
      self.class.get("/#{object}/#{id}", query: @options)
    end

    # POST to create new Objects.
    #
    # Posts are created by passing the Object type, and a String object of the POST body.
    #
    # Needed parameters are: schema, form, token, and account.
    #
    # ThePlatform.Data.mds.post('Media', '{"title":"First POST using the RUBYds","ownerId":"http://access.auth.theplatform.com/data/Account/2011111628"}',
    #             schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def post(object, body, options={})
      @options = options
      self.class.base_uri @endpoint
      set_header @options
      self.class.post("/#{object}", query: @options, body: body)
    end

    # PUT to edit Objects.
    #
    # Put needs the Object type and String body.
    #
    # Needed parameters: schema, form, token, and account.
    #
    # ThePlatform::Data.mds.put('Media', '{"id":""http://data.media.theplatform.com/media/data/Media/27444715"","title":"test"}',
    #             schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def put(object, body, options={})
      @options = options
      self.class.base_uri @endpoint
      set_header @options
      self.class.put("/#{object}", query: @options, body: body)
    end

    # DELETE objects
    #
    # To DELETE Objects, pass the Object type and comma separated IDs
    #
    # Needed parameters: schema, form, token, and account
    #
    # media.delete('Media','27550715', schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def delete(object,id=[],options={})
      @options = options
      self.class.base_uri @endpoint
      self.class.delete("/#{object}/#{id}", query: options)
    end

    private

    def set_header(option)
      if option[:form] == 'json'
        self.class.headers 'Content-Type' => 'application/json'
      elsif option[:form] == 'atom'
        self.class.headers 'Content-Type' => 'application/atom+xml'
      elsif option[:form] == 'rss'
        self.class.headers 'Content-Type' => 'application/rss+xml'
      end
    end

    def self.parameters
      {
        schema: @schema,
        form:   @form,
        token:  @token
      }
    end

    def self.options
      Hash[ThePlatform::Data.keys.map { |key| [key, instance_variable_get(:"@#{key}")] } ]
    end

  end

end
