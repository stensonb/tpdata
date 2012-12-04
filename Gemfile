RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems
gemspec

gem 'rake'

group :coverage do
  gem 'rspec'
  gem 'yard'
  gem 'webmock'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

if RUBY_ENGINE == 'jruby'
  gem 'jruby-openssl'
end
