$:.unshift( File.dirname( __FILE__ ))

require 'httparty'

# Start of wrapper for tpdata
module ThePlatform

  # Set gem version
  VERSION = '1.0.0'

  require 'theplatform/configuration'
  require 'theplatform/services'
  require 'theplatform/identity'
  require 'theplatform/data'

end
