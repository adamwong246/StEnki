StEnki::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  config.cache_store = :dalli_store

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w( admin.css admin.js login.css)
  #config.assets.precompile += %w( *.js *.css )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  require 'action_controller/metal/request_forgery_protection'

  StEnki::Application.config.middleware.use ExceptionNotifier,
    :ignore_exceptions    => [ActionController::InvalidAuthenticityToken],
    :email_prefix         => "[Enki] ",
    :sender_address       => [Enki::Config.default[:author, :email]],
    :exception_recipients => [Enki::Config.default[:author, :email]]


  # openauth_pure
  Rails.application.config.middleware.use OmniAuth::Builder do
    # ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!
    
    # you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
    require 'openid/store/filesystem'
    
    # load certificates
    require "openid/fetchers"
    OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
    
    # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here
    if CONFIG[:active_services].include?("facebook")
      provider :facebook, ENV['FB_ID'], ENV['FB_SECRET']
    end
    # provider :facebook, ENV['FB_ID'], ENV['FB_SECRET']
    provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET']
    provider :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET']
    
    # generic openid
    provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'openid'
    
    # dedicated openid
    provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
    provider :google_apps, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google_apps'
    # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com
    
    provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
    provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'aol', :identifier => 'openid.aol.com'
    provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'myopenid', :identifier => 'myopenid.com'
    
    # Sign-up urls for Facebook, Twitter, and Github
    # https://developers.facebook.com/setup
    # https://github.com/account/applications/new
    # https://developer.twitter.com/apps/new
  end
end
