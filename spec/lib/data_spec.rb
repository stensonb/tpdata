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

    it 'should return 200' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).get('', 'all', schema:'1.0', form:'json').code.should == 200
      end
    end

    it 'should make a GET against an endpoint' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).get('Object', 'all').request.instance_variable_get(:@http_method).should equal Net::HTTP::Get
      end
    end

    it 'should make a POST against an endpoint' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).post('Object', '{BODY}').request.instance_variable_get(:@http_method).should equal Net::HTTP::Post
      end
    end

    it 'should make a PUT against an endpoint' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).put('Object', '{BODY}').request.instance_variable_get(:@http_method).should equal Net::HTTP::Put
      end
    end

    it 'should make a DELETE against an endpoint' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).delete('Object', 'IDS').request.instance_variable_get(:@http_method).should equal Net::HTTP::Delete
      end
    end

    it 'should be able to use the NOTIFY method' do
      ThePlatform.const_get(:SERVICE).keys.each do |endpoint|
        ThePlatform::Data.send(endpoint).notify('options').request.instance_variable_get(:@http_method).should equal Net::HTTP::Get
      end
    end

  end

end
