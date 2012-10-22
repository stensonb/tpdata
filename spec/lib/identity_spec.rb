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
        @form = "json"
        @schema = "1.0"

        @signInURL = ThePlatform::IDENTITY + 'signIn'

        @query = { "_duration" => @duration,
                  "_idleTimeout" => @idleTimeout,
                  "form" => @form,
                  "password" => @password,
                  "schema" => @schema,
                  "username" => @userName }

        stub_request(:get, @signInURL).with(:query => @query).to_return(:status => 200, :body => {}, :headers => {})
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

      stub_request(:any, @signOutURL)
                  .with(:query => hash_including({}))
                  .to_return(:status => 200, :body => {}, :headers => {})
    end

    it "should call signOut endpoint with parameters" do
      @token = 'foo'

      ThePlatform::Identity.invalidate!(@token)

      WebMock.should have_requested(:get, @signOutURL)
             .with(:query => hash_including({"_token" => @token}))
    end

    it "should return a HTTParty::Response from the web request" do
      ThePlatform::Identity.invalidate!(@token).class.should == HTTParty::Response
    end

    it "should bubble up any exception" do
      stub_request(:any, @signOutURL)
                  .with(:query => hash_including({}))
                  .to_raise(Exception)

      expect {ThePlatform::Identity.invalidate!(@token)}.to raise_error(Exception)
    end

  end

  describe "#count" do
    before(:all) do
      @getTokenCountURL = ThePlatform::IDENTITY + 'getTokenCount'
    end

    before(:each) do
      WebMock.reset!

      stub_request(:any, @getTokenCountURL)
                  .with(:query => hash_including({}))
                  .to_return(:status => 200, :body => {}, :headers => {})
    end

    it "should call getTokenCount endpoint with parameters" do
      ThePlatform::Identity.count(foo: 'bar')

      WebMock.should have_requested(:get, @getTokenCountURL)
             .with(:query => hash_including({"foo" => 'bar'}))
    end

    it "should return a HTTParty::Response from the web request" do
      ThePlatform::Identity.count({}).class.should == HTTParty::Response
    end

    it "should bubble up any exception" do
      stub_request(:any, @getTokenCountURL)
                  .with(:query => hash_including({}))
                  .to_raise(Exception)

      expect {ThePlatform::Identity.invalidate!(@token)}.to raise_error(Exception)
    end

  end

end
