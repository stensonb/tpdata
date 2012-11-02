require 'spec_helper'

describe ThePlatform::Data do

  describe 'default attributes' do

    it 'should include HTTParty methods' do
      ThePlatform::Data.should include HTTParty
    end

  end

  describe 'endpoints' do

    it 'should make for new class methods' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.methods.should include endpoint
      end
    end

    it 'should return a list of available data service objects' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform.const_get(:SERVICE).values_at(endpoint)[0].keys.should include :objects
      end
    end

  end

  describe 'requests' do

    it 'should return a HTTParty::Response object' do
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/")
                    .with(:query => hash_including({}))
                    .to_return(:status => 200, :body => "", :headers => {})
        ThePlatform::Data.send(service).get('','all',{}).class == HTTParty::Response
      end
    end

    it 'should make a GET against an endpoint' do
      object = "Object"
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).get(object, 'all')

        WebMock.should have_requested(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
               .with(:query => hash_including({}))
      end
    end

    it 'should make a POST against an endpoint' do
      object = "Object"
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:post, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).post(object, 'all')

        WebMock.should have_requested(:post, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
               .with(:query => hash_including({}))
      end
    end

    it 'should make a PUT against an endpoint' do
      object = "Object"
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:put, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).put(object, 'all')

        WebMock.should have_requested(:put, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
               .with(:query => hash_including({}))
      end
    end

    it 'should make a DELETE against an endpoint' do
      object = "Object"
      objectId = '123'
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:delete, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object + "/" + objectId)
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).delete(object, objectId)

        WebMock.should have_requested(:delete, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object + "/" + objectId)
               .with(:query => hash_including({}))
      end
    end

    it 'should perform GET method on the NOTIFY endpoint' do
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "notify")
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).notify(token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk', size:'10', since:'11111111')

        WebMock.should have_requested(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'notify')
               .with(:query => hash_including({}))
      end
    end

    it 'should bubble up any exception' do
      object = "Object"
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                    .with(:query => hash_including({}))
                    .to_raise(Exception)

        expect{ThePlatform::Data.send(service).get(object, 'all')}.to raise_error(Exception)

        WebMock.should have_requested(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
               .with(:query => hash_including({}))
      end
    end

    it 'should show the gem name/version number as the User-Agent' do
      object = "Object"
      version = File.read(File.expand_path("../../../tpdata_version",__FILE__)).strip
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                    .with(:query => hash_including({}))

        ThePlatform::Data.send(service).get(object, 'all')

        WebMock.should have_requested(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
               .with(:query => hash_including({}), :headers => {"User-Agent" => "tpdata/#{version}"})
      end
    end

    it 'should make the correct Content-Type request' do
      object = "Object"
      ThePlatform.const_get(:SERVICE).keys.each do |service|
        WebMock.reset!
        content_type = {'atom' => 'application/atom+xml',
                        'rss'  => 'application/rss+xml',
                        'json' => 'application/json',
                        'cjson' => 'application/json'}

        content_type.each do |format|
          stub_request(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + "data/" + object)
                      .with(:query => {form:format[0]})

          ThePlatform::Data.send(service).get(object, 'all',form:format[0])

          WebMock.should have_requested(:get, ThePlatform.const_get(:SERVICE)[service][:endpoint] + 'data/' + object)
                 .with(:query => hash_including({form:format[0]}), :headers => {"Content-Type" => format[1]})
        end
      end
    end

  end

end
