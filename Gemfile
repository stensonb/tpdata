RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems
gemspec

group :coverage do
  gem 'rake'
  gem 'rspec'
  gem 'yard'
  gem 'webmock'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

if RUBY_ENGINE == 'jruby'
  gem 'jruby-openssl'
end
