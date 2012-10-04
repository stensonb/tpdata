module ThePlatform

  # Class to RESTfully interface with thePlatform's API
  #    ThePlatform::Data#
  class Data
    include HTTParty
    ssl_version :SSLv3
    extend ThePlatform::Configuration

    def initialize(params={})
      @endpoint = params[:endpoint]
      @objects  = params[:objects]
    end

    # Set the different available params to configure
    def self.keys
      @keys ||= [:schema, :form, :token]
    end

    # MetaMagic to initialize SERVICE hash into methods to create SERVICE objects
    (class << self; self; end).instance_eval do
      SERVICE.keys.each do |data|
        define_method(data) { self.new(endpoint: SERVICE[data][:endpoint], objects: SERVICE[data][:objects]) }
      end
    end

    # GET call for data Object.
    #
    # This is built by passing the Object, the comma delimited IDs, and the RESTful parameters.
    # To return all the Objects, pass 'all' for the id param.
    #
    # Needed paramters are: schema, form, and token
    #
    #    ThePlatform::Data.mds.get('Category','1278889',schema:'1.4.0',form:'json',token:'12uZynnc2zHvVNDokvgG0mmK33yOOd',account:'my_account')
    # or
    #    ThePlatform::Data.mds.get('Category','all',schema:'1.4.0',form:'json',token:'12uZynnc2zHvVNDokvgG0mmK33yOOd',account:'my_account')
    def get(object, id=[],options={})
      set_uri
      set_header options
      set_id = "/#{id}" unless id =~ /all/i
      self.class.get("/#{object}#{set_id}", query: extras.merge(options))
    end

    # POST to create new Objects.
    #
    # Posts are created by passing the Object type, and a String object of the POST body.
    #
    # Needed parameters are: schema, form, token, and account.
    #
    #    the_body = '{'title':'Using the RUBYds',"ownerId":"http://access.auth.theplatform.com/data/Account/2011111628"}'
    #    ThePlatform::Data.mds.put('Media', the_body,
    #      schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def post(object, body, options={})
      set_uri
      set_header options
      self.class.post("/#{object}", query: extras.merge(options), body: body)
    end

    # PUT to edit Objects.
    #
    # Put needs the Object type and String body.
    #
    # Needed parameters: schema, form, token, and account.
    #
    #    the_body = '{"id":""http://data.media.theplatform.com/media/data/Media/27444715"","title":"test"}'
    #    ThePlatform::Data.mds.put('Media', the_body,
    #      schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def put(object, body, options={})
      set_uri
      set_header options
      self.class.put("/#{object}", query: extras.merge(options), body: body)
    end

    # DELETE objects
    #
    # To DELETE Objects, pass the Object type and comma separated IDs
    #
    # Needed parameters: schema, form, token, and account
    #
    #    ThePlatform::Data.mds.delete('Media','27550715', schema:'1.4.0',form:'cjson',
    #      token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'Ruby Test Account')
    def delete(object,id=[],options={})
      set_uri
      self.class.delete("/#{object}/#{id}", query: extras.merge(options))
    end

    # NOTIFY endpoint
    #
    # This moves to the /notify endpoint of the data service
    #
    # Needed parameters: token
    #
    #    ThePlatform::Data.mds.notify(token:'G1yP1Zsp7nEHW2fug6glIQCjfjIIIl', size:'10', since:'289334341')
    def notify(options={})
      self.class.base_uri @endpoint
      self.class.get("/notify", query: options)
    end

    private

    def set_header(option)
      self.class.headers 'User-Agent' => "tpdata/#{VERSION}"
      if option[:form] =~ /(json|cjson)/i
        self.class.headers 'Content-Type' => 'application/json'
      elsif option[:form] == 'atom'
        self.class.headers 'Content-Type' => 'application/atom+xml'
      elsif option[:form] == 'rss'
        self.class.headers 'Content-Type' => 'application/rss+xml'
      end

    end

    def extras
      ThePlatform::Data.parameters
    end

    def set_uri
      self.class.base_uri "#{@endpoint}data/"
    end

  end

end
