require 'theplatform'

# use #configure to build a basic request
ThePlatform::Identity.configure do |c|
  c.username='my_username'  # substitute your creds here
  c.password='my_password'
  c.schema='1.0'
  c.form='json'
  c._duration='555000'      # defaults if not set
  c._idleTimeout='10000'    # defaults if not set
end

puts "Checking token count before requesting a token: #{ThePlatform::Identity.count["getTokenCountResponse"]}"

token = ThePlatform::Identity.token['signInResponse']['token']
puts "Just received new token: #{token}"

puts "Checking new token count: #{ThePlatform::Identity.count["getTokenCountResponse"]}"

puts 'Invalidating the token'

ThePlatform::Identity.invalidate!(token)

puts "Token count after invalidation: #{ThePlatform::Identity.count["getTokenCountResponse"]}"
