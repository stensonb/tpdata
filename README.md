# tpdata

## DESCRIPTION:

Tpdata gem is a wrapper for the RESTful interface for thePlatform for Media's Data Services.


## REQUIREMENTS:

The only Gem requirement is HTTParty

## INSTALL:

    gem install tpdata

## USAGE:

To add Tpdata gem:

    require 'theplatform'

### Tokens
To request a token:

    t = ThePlatform::Identity.new(username:'your_username', password:'your_password')
    => #<ThePlatform::Identity:0x007fda9e1d2f88
     @duration=nil,
     @password="your_password",
     @timeout=nil,
     @username="your_username">

    # Note that you there are 4 available options to set: username and password (which are required), duration, and timeout.

    token = t.token(schema: '1.0', form: 'json')
    => {"signInResponse"=>
    {"userName"=>"your_username",
    "duration"=>315360000000,
    "token"=>"rDGZTYyxjGqjfEXNsphawfAqIdfdDDff",
    "userId"=>
    "https://identity.auth.theplatform.com/idm/data/User/mps/123456789",
    "idleTimeout"=>1209600000}}

Valid paramters for token are the schema type (schema) and format (form).  Visit http://help.theplatform.com for more information.

### Data Services
A list of endpoints and valid objects are available at http://help.theplatform.com.  Internally, they are listed in the services.rb file.

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

Needed parameters are the Objects, Object ID(s), Schema, Form, and the Token (which can be built through the identity service)

A POST:

    media.post('Media', '{"title":"First POST using the RUBYds","ownerId":"http://access.auth.theplatform.com/data/Account/123456789"}',schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'My_Account')

Note that this is a JSON POST body, but is entered as a String object with a JSON body.

The same holds true for PUT values as well, media.put

A DELETE:

    media.delete('Media','27550715', schema:'1.4.0',form:'cjson',token:'Nez8Y9ScVDxPxLDmUsg_ESCDYJCJwPBk',account:'My_Account')

Needed params here are the Object, Object ID(s), schema, form, token, and account.

## LICENSE:

Copyright (c) 2012 Ben Woodall

This Gem is not developed by or affiliated with thePlatform for Media
