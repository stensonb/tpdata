RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source 'https://rubygems.org'
gemspec

gem 'rake'
gem 'rspec'
gem 'webmock'
gem 'yard'

group :coverage do
  gem 'simplecov'
  gem 'simplecov-rcov'
end

if RUBY_ENGINE == 'jruby'
  gem 'jruby-openssl'
end
