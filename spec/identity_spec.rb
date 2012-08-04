require 'spec_helper'

describe 'Identity' do

  # Created without Mocks.  Using creds instead for now

  before(:each) do
    @session = ThePlatform::Identity.new(:username => 'ben.woodall@theplatform.com', :password => 'S3cr3t')
  end

  describe "token" do
    it "should return all auth token params" do
      res = @session.token(schema: '1.0', form: 'json')
      res.should be_a Hash
      res.has_key?("signInResponse")
      token = res["signInResponse"]["token"]
      ThePlatform::Identity.new.invalidate!(token)
    end
  end

  describe "invalidate!" do
    it "should invalidate a token" do
      res = @session.token(schema: '1.0', form: 'json')
      token = res['signInResponse']['token']
      @session.invalidate!(token).has_key?("signOutResponse")
    end
  end

  describe "count" do
    it "should return the number of tokens" do
      res = @session.count(schema:'1.0', form:'json')
      res.should be_a Hash
    end
  end

end

