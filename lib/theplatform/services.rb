module ThePlatform

  class Services

  	def service
			{
	      :accessadmin  => { :endpoint => 'http://access.auth.theplatform.com/data/',
	      									 :objects => [ :permission, :registry, :role ] },
	      :enduser 		  => { :endpoint => 'http://enduser.access.auth.theplatform.com/data/',
	      									 :objects => [ :permission, :role ] },
	      :account      => { :endpoint => 'https://mps.theplatform.com/data/',
	      									 :objects => [ :account ] },
	      :console      => { :endpoint => 'http://data.mpx.theplatform.com/cds/',
	      									 :objects => [ ]},
	      :delivery     => { :endpoint => 'http://data.delivery.theplatform.com/delivery/data/',
	      									 :objects => [ :accountsettings, :adpolicy, :restriction ] },
	      :entitlements => { :endpoint => 'http://data.entitlement.theplatform.com/eds/data/',
	      									 :objects => [ :accountsettings, :device, :distributionrights, :entitlement,
	      									 							 :physicaldevice, :productdevice, :rights, :subjectpolicy, :userdevice ] },
	      :feedreader   => { :endpoint => 'http://feedreader.ingest.theplatform.com/feedreader/data/',
	      									 :objects => [ :feedreader ] },
	      :feeds 				=> { :endpoint => 'http://data.feed.theplatform.com/feed/data/',
	      									 :objects => [ :feedadapter, :feedconfig ] },
	      :ingest 			=> { :endpoint => 'http://adapter.ingest.theplatform.com/adapter/data/',
	      									 :objects => [ :adapter, :adapterconfiguration, :checksum ] },
	      :mds 					=> { :endpoint => 'http://data.media.theplatform.com/media/data/',
	      									 :objects => [ :accountsettings, :assettype, :category, :media,
	      									 							 :mediadefaults, :mediafile, :provider, :release, :server ] },
	      :mps 					=> { :endpoint => 'http://mps.theplatform.com/data/'},
	      :message 			=> { :endpoint => 'http://data.message.theplatform.com/message/data/',
	      									 :objects => [ :assettype, :category, :defaultserver, :media,
	      									 							 :mediafile, :release, :server ] },
	      :product 			=> { :endpoint => 'http://data.product.theplatform.com/product/data/',
	      									 :objects => [ :accountsettings, :pricingtemplate, :product, :producttag ] },
	      :publish 			=> { :endpoint => 'http://data.publish.theplatform.com/publish/data/',
	      									 :objects => [ :adapter, :adapterconfiguration, :publishprofile ] },
	      :sharing 			=> { :endpoint => 'http://data.social.community.theplatform.com/social/data/',
	      									 :objects => [ :outletprofile, :provideradapter ] },
	      :social 			=> { :endpoint => 'http://data.social.community.theplatform.com/social/data/',
	      									 :objects => [ :accountsettings, :comment, :rating, :totalrating ] },
	      :task 				=> { :endpoint => 'http://data.task.theplatform.com/task/data/',
	      									 :objects => [ :agent, :batch, :task, :tasktemplate, :tasktype ] },
	      :identity 		=> { :endpoint => 'https://identity.auth.theplatform.com/idm/data/',
	      									 :objects => [ :directory, :security, :user ] },
	      :euid 				=> { :endpoint => 'https://euid.theplatform.com/idm/data/',
	      									 :objects => [ :directory, :security, :user ] },
	      :userprofile 	=> { :endpoint => 'http://data.userprofile.community.theplatform.com/userprofile/data/',
	      									 :objects => [ :accountsettings, :totalitem, :userlist,
	      									 							 :userlistitem, :userprofile ] },
	      :validation 	=> { :endpoint => 'http://data.validation.theplatform.com/validation/data/',
	      									 :objects => [ :coditionsrule, :validationrule, :validator ] },
	      :watchfolder 	=> { :endpoint => 'http://watchfolder.ingest.theplatform.com/wf/data/',
	      									 :objects => [ :watchfolder, :watchfolderfile ] },
	      :workflow 		=> { :endpoint => 'http://data.workflow.theplatform.com/workflow/data/',
	      									 :objects => [ :profileresult, :profilestepresult, :workflowqueue ] }
	    }
	  end

  end

end
