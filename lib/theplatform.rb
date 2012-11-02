require 'httparty'

# Start of wrapper for tpdata
module ThePlatform

  # Set Version
  VERSION = File.read(File.expand_path("../../tpdata_version",__FILE__)).strip

  require 'theplatform/configuration'
  require 'theplatform/services'
  require 'theplatform/identity'
  require 'theplatform/data'

end
