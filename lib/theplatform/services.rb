module ThePlatform

  # URI for Identity service
  IDENTITY = "https://identity.auth.theplatform.com/idm/web/Authentication/"

  # Hash containing Data Services, along with their available objects
  SERVICE =
    {
      :accessadmin  => { :endpoint => 'http://access.auth.theplatform.com/',
                         :objects => [ :Account, :Permission, :Registry, :Role ] },
      :enduser      => { :endpoint => 'http://enduser.access.auth.theplatform.com/',
                         :objects => [ :Permission, :Role ] },
      :console      => { :endpoint => 'http://data.mpx.theplatform.com/cds/data',
                         :objects => [ :AccountSettings, :Command, :MenuItem, :Pane, :PaneState, :Panel,
                                       :Shortcut, :UserAccountSettings, :UserSettings, :View, :ViewLink ] },
      :delivery     => { :endpoint => 'http://data.delivery.theplatform.com/delivery/',
                         :objects => [ :AccountSettings, :AdPolicy, :Restriction ] },
      :entitlements => { :endpoint => 'http://data.entitlement.theplatform.com/eds/',
                         :objects => [ :AccountSettings, :Device, :DistributionRights, :Entitlement,
                                       :PhysicalDevice, :ProductDevice, :Rights, :SubjectPolicy, :UserDevice ] },
      :feedreader   => { :endpoint => 'http://feedreader.ingest.theplatform.com/feedreader/',
                         :objects => [ :FeedReader ] },
      :feeds        => { :endpoint => 'http://data.feed.theplatform.com/feed/',
                         :objects => [ :FeedAdapter, :FeedConfig ] },
      :ingest       => { :endpoint => 'http://adapter.ingest.theplatform.com/adapter/',
                         :objects => [ :Adapter, :AdapterConfiguration, :Checksum ] },
      :mds          => { :endpoint => 'http://data.media.theplatform.com/media/',
                         :objects => [ :AccountSettings, :AssetType, :Category, :Media,
                                       :MediaDefaults, :MediaFile, :Provider, :Release, :Server ] },
      :mps          => { :endpoint => 'http://mps.theplatform.com/',
                         :objects => [ :Account, :AssetType, :Batch, :Category, :DefaultServer, :Media,
                                       :MediaFile, :MediaRequest, :Release, :Server, :Task ]},
      :message      => { :endpoint => 'http://data.message.theplatform.com/message/',
                         :objects => [ :EmailTemplate, :MessageInstruction, :MessageQueue, :NotificationFilter ] },
      :product      => { :endpoint => 'http://data.product.theplatform.com/product/',
                         :objects => [ :AccountSettings, :PricingTemplate, :Product, :ProductTag ] },
      :publish      => { :endpoint => 'http://data.publish.theplatform.com/publish/',
                         :objects => [ :Adapter, :AdapterConfiguration, :PublishProfile ] },
      :sharing      => { :endpoint => 'http://data.social.community.theplatform.com/social/',
                         :objects => [ :OutletProfile, :ProviderAdapter ] },
      :social       => { :endpoint => 'http://data.social.community.theplatform.com/social/',
                         :objects => [ :AccountSettings, :Comment, :Rating, :TotalRating ] },
      :task         => { :endpoint => 'http://data.task.theplatform.com/task/',
                         :objects => [ :Agent, :Batch, :Task, :TaskTemplate, :TaskType ] },
      :identity     => { :endpoint => 'https://identity.auth.theplatform.com/idm/',
                         :objects => [ :Directory, :Security, :User ] },
      :euid         => { :endpoint => 'https://euid.theplatform.com/idm/',
                         :objects => [ :Directory, :Security, :User ] },
      :userprofile  => { :endpoint => 'http://data.userprofile.community.theplatform.com/userprofile/',
                         :objects => [ :AccountSettings, :TotalItem, :UserList,
                                       :UserListItem, :UserProfile ] },
      :validation   => { :endpoint => 'http://data.validation.theplatform.com/validation/',
                         :objects => [ :ConditionsRule, :ValidationRule, :Validator ] },
      :watchfolder  => { :endpoint => 'http://watchfolder.ingest.theplatform.com/wf/',
                         :objects => [ :WatchFolder, :WatchFolderFile ] },
      :workflow     => { :endpoint => 'http://data.workflow.theplatform.com/workflow/',
                         :objects => [ :ProfileResult, :ProfileStepResult, :WorkflowQueue ] }
    }

end
