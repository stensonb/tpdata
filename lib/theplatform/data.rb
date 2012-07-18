module ThePlatform

  class Data
    include HTTParty
    require 'json'
    debug_output $stderr

    def initialize(params={})
      @endpoint = params[:endpoint]
      @objects  = params[:objects]
    end


    (class << self; self; end).instance_eval do
      SERVICE.keys.each do |data|
        define_method(data) { self.new(endpoint: SERVICE[data][:endpoint], objects: SERVICE[data][:objects]) }
      end
    end

    # ThePlatform::Data.mds.get('Category','12744085', schema:'1.4.0',form:'json',token:'12uZynnc2zHvVNDokvgG0TC9UBD7EPDm')
    def get(object, id=[],options={})
      self.class.base_uri @endpoint
      self.class.get("/#{object}/#{id}", query: options)
    end

    # media.post('Media', '{"title":"First POST using the RUBYds","ownerId":"http://access.auth.theplatform.com/data/Account/2077866628"}',
    #             schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'BenWoodall (VMS)')
    def post(object, body, options={})
      @options = options
      self.class.base_uri @endpoint
      set_header @options
      self.class.post("/#{object}", query: options, body: body)
    end

    # media.put('Media', '{"id":""http://data.media.theplatform.com/media/data/Media/27550715"","title":"test"}',
    #             schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'BenWoodall (VMS)')
    def put(object, body, options={})
      @options = options
      self.class.base_uri @endpoint
      set_header @options
      self.class.put("/#{object}", query: options, body: body)
    end
    #media.delete('Media','27550715', schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'BenWoodall (VMS)')
    def delete(object,id=[],options={})
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

  end

end
