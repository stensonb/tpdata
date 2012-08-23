require 'theplatform'

#
ThePlatform::Identity.configure do |c|
  c.username='my_username'  # substitute your creds here
  c.password='my_password'
  c.schema='1.0'
  c.form='json'
  c._duration='555000'      # defaults if not set
  c._idleTimeout='10000'    # defaults if not set
end

puts "Checking token count before requesting a token: #{ThePlatform::Identity.new.count["getTokenCountResponse"]}"

token = ThePlatform::Identity.new.token['signInResponse']['token']
puts "Just received new token: #{token}"

puts "Checking new token count: #{ThePlatform::Identity.new.count["getTokenCountResponse"]}"

puts 'Invalidating the token'

ThePlatform::Identity.new.invalidate!(token)

puts "Token count after invalidation: #{ThePlatform::Identity.new.count["getTokenCountResponse"]}"
