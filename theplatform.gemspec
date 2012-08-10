$:.push File.expand_path("../lib", __FILE__)
require 'theplatform'

Gem::Specification.new do |s|
  s.name             = 'tpdata'
  s.version          = ThePlatform::VERSION
  s.date             = '2012-08-10'
  s.authors          = ['Ben Woodall']
  s.email            = 'ben.woodall@theplatform.com'
  s.homepage         = 'https://github.com/benwoody'

  s.summary          = %q{RESTful wrapper for thePlatform}
  s.description      = %q{Tpdata gem is a wrapper for the RESTful interface for thePlatform for Media's Data Services.}

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths    = ["lib"]

  s.extra_rdoc_files = ["README.md"]

  s.add_runtime_dependency 'httparty', "~> 0.8.3"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
end
