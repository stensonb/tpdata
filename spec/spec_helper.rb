require 'rubygems'
require 'rspec'
require 'webmock/rspec'
require 'json'

if ENV["COVERAGE"] == 'true'
  require 'simplecov'

  # add legacy rcov output (so Jenkins/Sonor play well)
  require 'simplecov-rcov'
  class SimpleCov::Formatter::MergedFormatter
    def format(result)
       SimpleCov::Formatter::HTMLFormatter.new.format(result)
       SimpleCov::Formatter::RcovFormatter.new.format(result)
    end
  end
  SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter

  SimpleCov.start
end

require File.expand_path("../../lib/theplatform", __FILE__)
