require 'rubygems'
require 'rspec'
require 'webmock/rspec'
require 'json'

if ENV["COVERAGE"] == 'true'
  require 'simplecov'
  SimpleCov.start
end

require File.expand_path("../../lib/theplatform", __FILE__)
