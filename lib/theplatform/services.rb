module ThePlatform

  # URI for Identity service
  IDENTITY = "https://identity.auth.theplatform.com/idm/web/Authentication/"

  # Hash containing Data Services, along with their available objects
  SERVICE =
    {
      :accessadmin  => { :endpoint => 'http://access.auth.theplatform.com/data/',
                         :objects => [ :Account, :Permission, :Registry, :Role, :SuperUser ] },
      :enduser      => { :endpoint => 'http://enduser.access.auth.theplatform.com/data/',
                         :objects => [ :Permission, :Role ] },
      :account      => { :endpoint => 'https://mps.theplatform.com/data/',
                         :objects => [ :Account ] },
      :console      => { :endpoint => 'http://data.mpx.theplatform.com/cds/',
                         :objects => [ ]},
      :delivery     => { :endpoint => 'http://data.delivery.theplatform.com/delivery/data/',
                         :objects => [ :AccountSettings, :AdPolicy, :Restriction ] },
      :entitlements => { :endpoint => 'http://data.entitlement.theplatform.com/eds/data/',
                         :objects => [ :AccountSettings, :Device, :DistributionRights, :Entitlement,
                                       :PhysicalDevice, :ProductDevice, :Rights, :SubjectPolicy, :UserDevice ] },
      :feedreader   => { :endpoint => 'http://feedreader.ingest.theplatform.com/feedreader/data/',
                         :objects => [ :FeedReader ] },
      :feeds        => { :endpoint => 'http://data.feed.theplatform.com/feed/data/',
                         :objects => [ :FeedAdapter, :FeedConfig ] },
      :ingest       => { :endpoint => 'http://adapter.ingest.theplatform.com/adapter/data/',
                         :objects => [ :Adapter, :AdapterConfiguration, :Checksum ] },
      :mds          => { :endpoint => 'http://data.media.theplatform.com/media/data/',
                         :objects => [ :AccountSettings, :AssetType, :Category, :Media,
                                       :MediaDefaults, :MediaFile, :Provider, :Release, :Server ] },
      :mps          => { :endpoint => 'http://mps.theplatform.com/data/',
                         :objects => [ :Account, :AssetType, :Batch, :Category, :DefaultServer, :Media,
                                       :MediaFile, :MediaRequest, :Release, :Server, :Task ]},
      :message      => { :endpoint => 'http://data.message.theplatform.com/message/data/',
                         :objects => [ :EmailTemplate, :MessageInstruction, :MessageQueue, :NotificationFilter ] },
      :product      => { :endpoint => 'http://data.product.theplatform.com/product/data/',
                         :objects => [ :AccountSettings, :PricingTemplate, :Product, :ProductTag ] },
      :publish      => { :endpoint => 'http://data.publish.theplatform.com/publish/data/',
                         :objects => [ :Adapter, :AdapterConfiguration, :PublishProfile ] },
      :sharing      => { :endpoint => 'http://data.social.community.theplatform.com/social/data/',
                         :objects => [ :OutletProfile, :ProviderAdapter ] },
      :social       => { :endpoint => 'http://data.social.community.theplatform.com/social/data/',
                         :objects => [ :AccountSettings, :Comment, :Rating, :TotalRating ] },
      :task         => { :endpoint => 'http://data.task.theplatform.com/task/data/',
                         :objects => [ :Agent, :Batch, :Task, :TaskTemplate, :TaskType ] },
      :identity     => { :endpoint => 'https://identity.auth.theplatform.com/idm/data/',
                         :objects => [ :Directory, :Security, :User ] },
      :euid         => { :endpoint => 'https://euid.theplatform.com/idm/data/',
                         :objects => [ :Directory, :Security, :User ] },
      :userprofile  => { :endpoint => 'http://data.userprofile.community.theplatform.com/userprofile/data/',
                         :objects => [ :AccountSettings, :TotalItem, :UserList,
                                       :UserListItem, :UserProfile ] },
      :validation   => { :endpoint => 'http://data.validation.theplatform.com/validation/data/',
                         :objects => [ :ConditionsRule, :ValidationRule, :Validator ] },
      :watchfolder  => { :endpoint => 'http://watchfolder.ingest.theplatform.com/wf/data/',
                         :objects => [ :WatchFolder, :WatchFolderFile ] },
      :workflow     => { :endpoint => 'http://data.workflow.theplatform.com/workflow/data/',
                         :objects => [ :ProfileResult, :ProfileStepResult, :WorkflowQueue ] }
    }

end
