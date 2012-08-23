require './lib/theplatform.rb'

# request a new token!
token = ThePlatform::Identity.token(username:'my_username',password:'my_password',schema:'1.0',form:'json')

# use #configure to build a basic request
ThePlatform::Data.configure do |c|
  c.schema='1.4.0'
  c.form='cjson'
  c.token=token['signInResponse']['token']
end

# return all the Categories!
puts ThePlatform::Data.mds.get('Category','all',account:'my_account')
