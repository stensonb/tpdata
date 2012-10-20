require 'spec_helper'

describe ThePlatform::Identity do

  describe 'default attributes' do

    it 'should include HTTParty methods' do
      ThePlatform::Identity.should include HTTParty
    end

  end

  describe "#token" do

    it "should return the token field of a 200 response" do

      #setup a normal response
      duration = ""
      idleTimeout = ""
      userName = "user"
      password = "secret"
      token = "abcdefghijklmnopqrstuvwxyz123456"

      query = { "_duration" => duration,
                "_idleTimeout" => idleTimeout,
                "form" => "json",
                "password" => password,
                "schema" => "1.0", 
                "username" => userName }

      # stub the valid credential login
      h = Hash.new
      h["signInResponse"] = {"duration" => duration, 
                             "idleTimeout" => idleTimeout, 
                             "token" => "abcdefghijklmnopqrstuvwxyz123456",
                             "userId" => "https://someUserURI",
                             "userName" => userName }

      stub_request(:get, ThePlatform::IDENTITY + 'signIn').with(:query => query).to_return(:status => 200, :body => h.to_json, :headers => {})

      JSON.parse(ThePlatform::Identity.token(username:userName, password:password, form:query['form'], schema:query['schema']).body)["signInResponse"]["token"].should == token
      
    end

    it 'should not contain a token field given invalid credentials' do

      #setup an invalid credential request
      duration = ""
      idleTimeout = ""
      userName = "user"
      password = "badsecret"

      query = { "_duration" => duration,
                "_idleTimeout" => idleTimeout,
                "form" => "json",
                "password" => password,
                "schema" => "1.0", 
                "username" => userName }

      # stub the invalid credential response
      h = Hash.new
      h["responseCode"] = 401
      h["description"] = "Could not authenticate user " + userName + "."
      h["title"] = "com.theplatform.authentication.api.exception.AuthentcationException",
      h["correlationId"] = "somerandomUUID"
      h["isException"] = "true"

      stub_request(:get, ThePlatform::IDENTITY + 'signIn').with(:query => query).to_return(:status => 200, :body => h.to_json, :headers => {})

      JSON.parse(ThePlatform::Identity.token(username:userName, password:password, form:query['form'], schema:query['schema']).body).key?("token").should == false

    end

    pending 'should do something when the connection is reset' do
       #TODO: define this
    end

  end

  describe "#invalidate!" do

    # tP identity always returns a 200 and empty signOutResponse hash, even if the token was invalid
    # must be a security thing :)
    it 'should return a hash with an empty signOutResponse' do
      stub_request(:get, ThePlatform::IDENTITY + 'signOut').with(:query => hash_including("form" => 'json', "schema" => '1.0')).to_return(:status => 200, :body => '{ "signOutResponse": {}}', :headers => {})

      JSON.parse(ThePlatform::Identity.invalidate!('blah1234', form:'json', schema:'1.0').body)["signOutResponse"].should == {}
    end

    pending 'should do something when the connection is reset' do
      #TODO: define this
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
