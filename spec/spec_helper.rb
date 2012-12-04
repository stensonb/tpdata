require 'rubygems'
require 'rspec'

RSpec.configure do |config|
  config.order = 'random'
end

if ENV["COVERAGE"] == 'true'
  require 'webmock/rspec'
  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter
  ]
  SimpleCov.start
end

require File.expand_path("../../lib/theplatform", __FILE__)
