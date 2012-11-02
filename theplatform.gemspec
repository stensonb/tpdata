version = File.read(File.expand_path("../tpdata_version",__FILE__)).strip

Gem::Specification.new do |s|
  s.name             = 'tpdata'
  s.version          = version

  s.summary          = "RESTful wrapper for thePlatform"
  s.description      = "Tpdata gem is a wrapper for the RESTful interface for thePlatform for Media's Data Services."

  s.authors          = ["Ben Woodall","Bryan Stenson"]
  s.email            = 'mail@benwoodall.com'
  s.homepage         = 'http://github.com/benwoody/tpdata'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths    = ["lib"]

  s.extra_rdoc_files = ["README.md"]

  s.add_dependency 'httparty', "~> 0.9.0"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'

end
