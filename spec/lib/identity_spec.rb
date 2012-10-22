require 'spec_helper'

describe ThePlatform::Identity do

  # clear webmock stubs before each test
  before(:each) do
    WebMock.reset!
  end

  describe 'default attributes' do

    it 'should include HTTParty methods' do
      ThePlatform::Identity.should include HTTParty
    end

  end

  describe "#token" do

      # stub "valid credentials" identity call
      before(:each) do
        # reset anything from previous tests
        WebMock.reset!

        #setup a normal response
        @duration = ""
        @idleTimeout = ""
        @userName = "user"
        @password = "secret"
        @token = "abcdefghijklmnopqrstuvwxyz123456"
        @userId = "https://someUserURI"
        @form = "json"
        @schema = "1.0"

        @signInURL = ThePlatform::IDENTITY + 'signIn'

        @query = { "_duration" => @duration,
                  "_idleTimeout" => @idleTimeout,
                  "form" => @form,
                  "password" => @password,
                  "schema" => @schema,
                  "username" => @userName }

        # stub the valid credential login
        @response_body = Hash.new
        @response_body["signInResponse"] = {"duration" => @duration, 
                                            "idleTimeout" => @idleTimeout, 
                                            "token" => @token,
                                            "userId" => @userId,
                                            "userName" => @userName }

        stub_request(:get, @signInURL).with(:query => @query).to_return(:status => 200, :body => @response_body.to_json, :headers => {})
      end

    it "should call signIn endpoint with parameters" do
      ThePlatform::Identity.token(username: @userName, password: @password, form: @form, schema: @schema)
      WebMock.should have_requested(:get, @signInURL)
             .with(:query => hash_including({"username" => @userName, 
                                             "password" => @password,
                                             "form" => @form,
                                             "schema" => @schema}))
    end

    it "should return a HTTParty::Response from the web request" do
      ThePlatform::Identity.token(username: @userName, password: @password, form: @form, schema: @schema).class.should == HTTParty::Response
    end

    it "should bubble up any exception" do
      stub_request(:any, @signInURL)
                  .with(:query => hash_including({}))
                  .to_raise(Exception)

      expect {ThePlatform::Identity.token(username: @userName, password: @password, from: @form, schema: @schema)}.to raise_error(Exception)
    end

  end

  describe "#invalidate!" do
    before(:all) do
      @signOutURL = ThePlatform::IDENTITY + 'signOut'
    end

    before(:each) do
      WebMock.reset!
    end

    it "should call signOut endpoint with parameters" do
      @token = 'foo'

      stub_request(:any, @signOutURL)
                  .with(:query => hash_including({}))
                  .to_return(:status => 200, :body => {}, :headers => {})

      ThePlatform::Identity.invalidate!(@token)

      WebMock.should have_requested(:get, @signOutURL)
             .with(:query => hash_including({"_token" => @token}))
    end

    it "should bubble up any exception" do
      stub_request(:any, @signOutURL)
                  .with(:query => hash_including({}))
                  .to_raise(Exception)

      expect {ThePlatform::Identity.invalidate!(@token)}.to raise_error(Exception)
    end

  end

  describe "#count" do

    it 'should return a token count for valid user' do

      #setup a normal response
      duration = ""
      idleTimeout = ""
      userName = "user"
      password = "secret"
      token = "abcdefghijklmnopqrstuvwxyz123456"
      token_count = 2

      query = { "_duration" => duration,
                "_idleTimeout" => idleTimeout,
                "form" => "json",
                "password" => password,
                "schema" => "1.0", 
                "username" => userName }

      # stub the valid credential login
      h = { "getTokenCountResponse" => token_count }

      stub_request(:get, ThePlatform::IDENTITY + 'getTokenCount').with(:query => query).to_return(:status => 200, :body => h.to_json, :headers => {})

      JSON.parse(ThePlatform::Identity.count(username:userName, password:password, form:query['form'], schema:query['schema']).body)["getTokenCountResponse"] == token_count

    end

    it 'should not contain a token count for invalid user' do
      #setup an invalid response
      duration = ""
      idleTimeout = ""
      userName = "user"
      password = "secret"

      query = { "_duration" => duration,
                "_idleTimeout" => idleTimeout,
                "form" => "json",
                "password" => password,
                "schema" => "1.0", 
                "username" => userName }

      # stub the invalid credential login
      h = { "responseCode"=>401, 
            "description"=>"Could not authenticate user " + userName + ".",
            "title"=>"com.theplatform.authentication.api.exception.AuthenticationException", 
            "correlationId"=>"someUUIDhere", 
            "isException"=>true}

      stub_request(:get, ThePlatform::IDENTITY + 'getTokenCount').with(:query => query).to_return(:status => 200, :body => h.to_json, :headers => {})

      JSON.parse(ThePlatform::Identity.count(username:userName, password:password, form:query['form'], schema:query['schema']).body).key?("getTokenCountResponse").should == false
    end

    pending 'should do something when the connection is reset' do
      #TODO: define this
    end

  end
end
