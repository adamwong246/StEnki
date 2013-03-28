source "http://rubygems.org"

gem 'debugger'

gem 'font-awesome-sass-rails'

gem "thin", "~> 1.4.1"
gem 'dalli', '~>1.0.5' # memcaching on heroku
gem 'slim'
gem 'simple_form', '~> 2.0'
gem "nokogiri"
gem "htmlentities" # A module for encoding and decoding (X)HTML entities.
gem 'rails_admin'#, :git => 'git@github.com:sferik/rails_admin.git' #:path =>'~/PersonalProgramming/rails_admin'
gem "rails_admin_nestable"#, git: "git://github.com/dalpo/rails_admin_nestable.git" #:path =>'~/PersonalProgramming/rails_admin_nestable'#git: "git://github.com/dalpo/rails_admin_nestable.git"
# gem 'rails_admin_toggleable'
gem "rails_admin_import", :git => "git://github.com/adamwong246/rails_admin_import.git"
# gem "rails_admin_import", :path => "~/Programming/rails_admin_import"

gem "paper_trail"
gem 'ancestry'
gem 'sextant'

gem 'jquery-rails'
gem 'faker'
gem 'high_voltage'
gem 'builder' # for building xml/html, it's better than content_tag

gem 'simple-navigation'
# gem 'simple-navigation', :path => "~/git/simple-navigation/"

gem 'feedzirra'



gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-openid'
gem 'omniauth-google-apps'
gem 'omniauth-identity'
gem 'oauth2'
gem 'devise'
gem 'cancan'
gem 'rolify'

gem "best_in_place" 
gem 'RedCloth', '~> 4.2.9', :require => 'redcloth'
gem 'ruby-openid', :require => 'openid'
gem 'rack-openid', :require => 'rack/openid'
gem 'aaronh-chronic', :require => 'chronic' # Fixes for 1.9.2
gem 'coderay'
gem 'lesstile'
gem 'formtastic'
gem 'kaminari'
# gem 'exception_notification', '~> 2.5.2'

gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'coffee-rails', "~> 3.2.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass'
  gem 'compass-rails'
  # gem 'therubyracer' #heroku says unnesecary but I need it for less to work
  # gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
end

platforms :ruby do
  gem 'pg'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'trinidad'
  gem 'jruby-openssl'
end

group :production do
  gem 'exception_notification', '~> 2.5.2'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :test do
  gem 'database_cleaner'
  gem 'cucumber-rails',    :require => false
  gem 'cucumber-websteps', :require => false
  gem 'factory_girl_rails'
  gem 'rspec'
  # gem 'nokogiri', '~> 1.5.0'
  gem 'webrat'
  gem 'sqlite3'
  gem 'mailcatcher'
  gem 'steak'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'aaronh-chronic' # A natural language date parser with timezone support
  gem 'rails-footnotes', '>= 3.7.5.rc4', :group => :development
  
end



group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-test'
  gem 'guard-cucumber'
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'guard-coffeescript'
  # guard dependencies, they silently fail to install (FYI, that's a good thing)
  gem 'rb-inotify', :require => false # for linux
  gem 'rb-fsevent', :require => false # for OS X
  gem 'rb-fchange', :require => false # for windows
  #######

  gem 'ruby-prof' # method benchmarking

end

group :production do 
  # gem "rails_admin_import", :git => "git://github.com/adamwong246/rails_admin_import.git"
end

# group :development do
#   if RUBY_PLATFORM=~ /darwin/i
#     # Mac gems go here
#   else
#     # Non mac gem s go here 
#     gem 'libv8', '~> 3.11.8'
#     gem 'execjs'
#     gem 'therubyracer'
#   end
# end
