$:.push File.expand_path("../lib", __FILE__)
version = File.read(File.expand_path("../tpdata_version",__FILE__)).strip

Gem::Specification.new do |s|
  s.name             = 'tpdata'
  s.version          = version
  s.date             = '2012-10-03'
  s.authors          = ['Ben Woodall, Bryan Stenson']
  s.email            = 'mail@benwoodall.com'
  s.homepage         = 'http://github.com/benwoody/tpdata'

  s.summary          = %q{RESTful wrapper for thePlatform}
  s.description      = %q{Tpdata gem is a wrapper for the RESTful interface for thePlatform for Media's Data Services.}

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths    = ["lib"]

  s.extra_rdoc_files = ["README.md"]

  s.add_dependency 'httparty', "~> 0.9.0"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'webmock'
end
