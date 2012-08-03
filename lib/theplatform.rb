$:.unshift( File.dirname( __FILE__ ))

require 'httparty'

module ThePlatform

  VERSION = '0.0.0'

  require 'theplatform/services'
  require 'theplatform/identity'
  require 'theplatform/data'

end
