require 'spec_helper'

describe ThePlatform::Identity do

  it 'should include HTTParty methods' do
    ThePlatform::Identity.should include HTTParty
  end

  before(:each) do
    @session = ThePlatform::Identity.token(:username => 'ben.woodall@theplatform.com', :password => 'Behilikus420', schema: '1.0', form: 'json')
  end

  describe "token" do
    it "should return all auth token params" do
      res = @session
      res.should be_a Hash
      res.has_key?("signInResponse")
      token = res["signInResponse"]["token"]
      ThePlatform::Identity.invalidate!(token)
    end
  end

  describe "invalidate!" do
    it "should invalidate a token" do
      res = @session
      token = res['signInResponse']['token']
      ThePlatform::Identity.invalidate!(token).has_key?("signOutResponse")
    end
  end

  describe "count" do
    it "should return the number of tokens" do
      res = @session.count
      res.should be_a Fixnum
    end
  end

end

