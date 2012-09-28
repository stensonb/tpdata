require 'spec_helper'

describe ThePlatform::Identity do

  describe 'default attributes' do

    it 'should include HTTParty methods' do
      ThePlatform::Identity.should include HTTParty
    end

  end

  describe "#token" do

    it "should return a 200 response" do
      ThePlatform::Identity.token(form:'json', schema:'1.0').code.should == 200
    end

    it 'should return BAD REQUEST if no schema or form present' do
      ThePlatform::Identity.token(test:1, test:2).code.should == 422
    end

    it 'should have a valid return body' do
      ThePlatform::Identity.token(form:'json', schema:'1.0')['description'].should == "No authentication header."
    end

    it 'should not authenticate an invalid user' do
      ThePlatform::Identity.token(form:'json', schema:'1.0', username:'test', password:'pass')['description'].should == "Could not authenticate user test."
    end
  end

  describe "#invalidate!" do

    it 'should return a 200 response' do
      ThePlatform::Identity.invalidate!('omg_i_haz_a_tokenz', form:'json', schema:'1.0').code.should == 200
    end

    it 'should have a valid return body' do
      ThePlatform::Identity.invalidate!('omg_i_haz_a_tokenz', form:'json', schema:'1.0').should have_key 'signOutResponse'
    end

  end

  describe "#count" do

    it "should return a 200 response" do
      ThePlatform::Identity.count(form:'json', schema:'1.0').code.should == 200
    end

    it 'should return a BAD REQUEST if no schema or form are present' do
      ThePlatform::Identity.count(test:1, test:2).code.should == 422
    end

    it 'should fail if auth is invalid' do
      ThePlatform::Identity.count(form:'json', schema:'1.0', username:'test', password:'pass')['description'].should == "Could not authenticate user test."
    end

  end

end

