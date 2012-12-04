RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems
gemspec

gem 'rake'
gem 'rspec'

group :coverage do
  gem 'yard'
  gem 'webmock'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

if RUBY_ENGINE == 'jruby'
  gem 'jruby-openssl'
end
