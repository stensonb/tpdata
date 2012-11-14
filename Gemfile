RUBY_ENGINE = 'ruby' unless defined? RUBY_ENGINE
source :rubygems
gemspec

if RUBY_ENGINE == 'jruby'
  gem 'jruby-openssl'
end
