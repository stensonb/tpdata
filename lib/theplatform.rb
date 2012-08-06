$:.unshift( File.dirname( __FILE__ ))

require 'httparty'

module ThePlatform

  VERSION = '0.8.1'

  require 'theplatform/services'
  require 'theplatform/identity'
  require 'theplatform/data'

end
