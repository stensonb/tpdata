require './lib/theplatform.rb'

token = ThePlatform::Identity.new(username:'ben.woodall@theplatform.com',password:'Behilikus420').token(schema:'1.0',form:'json')
puts token
