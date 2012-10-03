# tpdata

[![Build Status](https://travis-ci.org/benwoody/tpdata.png)](https://travis-ci.org/benwoody/tpdata)


## DESCRIPTION:

Tpdata gem is a wrapper for the RESTful interface for thePlatform for Media's Data Services.


## REQUIREMENTS:

HTTParty ~> 0.9.0

## INSTALL:

    gem install tpdata

or

    gem build theplatform.gemspec

## USAGE:

To add Tpdata gem:

    require 'theplatform'

### Configuration
Both endpoints (::Data and ::Identity) support the #configure methods to build instance variables on a per object basis.

    ThePlatform::Data.configure do |config|
      config.schema = '1.4.0'
      config.form   = 'cjson'
      config.token  = 'rDGZTYyxjGqjfEXNsphawfAqIdfdDDff'
    end
    => {:schema=>"1.4.0", :form=>"cjson", :token=>"rDGZTYyxjGqjfEXNsphawfAqIdfdDDff"}

If the #configurate method is used, it does not have to be added in the request.

To list the available params to configure:

    ThePlatform::Identity.parameters
    => {:schema=>nil, :form=>nil, :username=>nil, :password=>nil, :_duration=>nil, :_idleTimeout=>nil}

The boolean methods #parameters? is also available to query if all params are set:

    ThePlatform::Identity.parameters?
    => true

### Tokens
To request a token:

    ThePlatform::Identity.token(username:'your_username', password:'your_password',schema:'1.0',form:'json')
    => {"signInResponse"=>
    {"userName"=>"your_username",
    "duration"=>315360000000,
    "token"=>"rDGZTYyxjGqjfEXNsphawfAqIdfdDDff",
    "userId"=>
    "https://identity.auth.theplatform.com/idm/data/User/mps/123456789",
    "idleTimeout"=>1209600000}}

Note that you can also set _duration and _idleTimeout as well.  Visit http://help.theplatform.com for more information.

### Data Services
A list of endpoints and valid objects are available at http://help.theplatform.com.  Internally, they are listed in the lib/theplatform/services.rb file.

In this example, we're going to build a query for the Media Data Service (MDS):

    media = ThePlatform::Data.mds
     @endpoint="http://data.media.theplatform.com/media/data/",
     @objects=
      [:AccountSettings,
       :AssetType,
       :Category,
       :Media,
       :MediaDefaults,
       :MediaFile,
       :Provider,
       :Release,
       :Server]>

The return value for any Service Object is its endpoint and the available objects.
To build the query for a GET:

    media.get('Category','12744085', schema:'1.4.0',form:'json',token:'12uZynnc2zHvVNDokvgG0TC9UBD7EPDm')

Needed parameters are the Objects, Object ID(s), Schema, Form, and the Token (which can be built through the ThePlatform::Identity)

To request all objects, pass 'all' to the id param.  To return multiple objects, pass a String with comma separated IDs.

A POST:

    media.post('Media', '{"title":"First POST using the RUBYds","ownerId":"http://access.auth.theplatform.com/data/Account/123456789"}',schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'My_Account')

Note that this is a JSON POST body, but is entered as a String object with a JSON body.

The same holds true for PUT values as well, media.put

A DELETE:

    media.delete('Media','27550715', schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'My_Account')

Needed params here are the Object, Object ID(s), schema, form, token, and account.

Notify:

The Notify endpoint is supported as well.

    media.notify(token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk', size:'10', since:'11111111')


## LICENSE:

MIT License (c) 2012 Ben Woodall

Fork it. Fix it. Push it. Pull it.
