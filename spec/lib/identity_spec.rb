require 'spec_helper'

describe ThePlatform::Identity do

  describe 'default attributes' do

    it 'should include HTTParty methods' do
      ThePlatform::Identity.should include HTTParty
    end

  end

  describe "token" do

    stub_request(:get, ThePlatform::Identity.token(schema:'1.0', form:'json', username:'test_user', password:'password')).
  to_return(:status => 200, :body => "", :headers => {})

    it 'should work' do
      ThePlatform::Identity.token(schema:'1.0', form:'json', username:'test_user', password:'password')
    end

    it "should return all auth token params" do
      res = @token
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

