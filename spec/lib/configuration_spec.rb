require 'spec_helper'

describe ThePlatform::Configuration do

  describe 'mass configuration' do

    before do
      ThePlatform::Data.configure do |config|
        config.schema = '1.4.0'
        config.form   = 'cjson'
        config.token  = 'my_token'
      end
    end

    it 'should set instance variables' do
      ThePlatform::Data.parameters[:schema].should == '1.4.0'
      ThePlatform::Data.parameters[:form].should == 'cjson'
      ThePlatform::Data.parameters[:token].should == 'my_token'
    end

    it 'should return true if all values are set' do
      ThePlatform::Data.parameters?.should be true
    end

    it 'should return false if all values are not set' do
      ThePlatform::Data.schema = nil
      ThePlatform::Data.parameters[:schema].should == nil
      ThePlatform::Data.parameters?.should be false
    end

  end

  describe 'endpoints' do

    it 'should list correct keys for ::Data' do
      ThePlatform::Data.keys.should == [:schema, :form, :token]
    end

    it 'should list correct keys for ::Identity' do
      ThePlatform::Identity.keys.should == [:schema, :form, :username, :password, :_duration, :_idleTimeout]
    end

  end

end
