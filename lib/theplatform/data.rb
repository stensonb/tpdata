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

    # def post(body)
    #   self.class.base_uri @endpoint
    #   self.class.post("/#{object}",  query: body)
    # end

    def put(object, body, options={})
      # options = {body: body, query: {schema: '1.4.0', form: 'json', token: 'ZvQnJThMUUp5w1BxkpgJkaAZYCD-8MCN'}}
      @options = options
      self.class.base_uri @endpoint
      set_header(@options)
      self.class.put("/#{object}", query: options, body: body)
    end

    # def delete
    # end

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
