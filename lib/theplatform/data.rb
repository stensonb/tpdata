module ThePlatform

  class Data
    include HTTParty

    def initialize(params={})
      @endpoint = params[:endpoint]
      @objects  = params[:objects]
    end


    (class << self; self; end).instance_eval do
      SERVICE.keys.each do |data|
        define_method(data) { self.new(endpoint: SERVICE[data][:endpoint], objects: SERVICE[data][:objects]) }
      end
    end

    def get(object, id=[],options={})
      self.class.base_uri @endpoint
      self.class.get("/#{object}/#{id}", query: options)
    end

    # def post(body)
    #   self.class.base_uri @endpoint
    #   self.class.post("/#{object}",  query: body)
    # end

    # def put #(object, body)
    #   self.class.base_uri @endpoint
    #   self.class.put("/Category/12744085?schema=1.4.0&form=cjson&token=RFSe2R2yqoWqzg_xYdgIcYCbEKAfIMBd", {"id" => "http://data.media.theplatform.com/media/data/Category/12744085","description" => "Hello World"})
    # end

    # def delete
    # end

  end

end
