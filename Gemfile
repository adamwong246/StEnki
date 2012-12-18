source "http://rubygems.org"
#gem 'rake', '10.0.2'

# To use debugger
# gem 'ruby-debug'

#gem 'rails', '3.2.0'
gem 'libv8', '~> 3.11.8'

gem 'execjs'

gem 'therubyracer'

gem "thin", "~> 1.4.1"

gem 'dalli', '~>1.0.5' # memcaching on heroku

gem 'slim'
gem 'simple_form', '~> 2.0'

gem 'turbolinks'

gem "nokogiri"
gem "htmlentities"

gem 'rails_admin'#, :git => 'git@github.com:sferik/rails_admin.git' #:path =>'~/PersonalProgramming/rails_admin'
gem "rails_admin_nestable", git: "git://github.com/dalpo/rails_admin_nestable.git" #:path =>'~/PersonalProgramming/rails_admin_nestable'#git: "git://github.com/dalpo/rails_admin_nestable.git"
gem 'ancestry'

gem 'sextant'

gem 'devise'
gem "cancan"
gem 'rolify'

gem 'jquery-rails'
gem 'bootswatch-rails'

gem 'faker'

# gem 'oa-oauth', :require => 'omniauth/oauth'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-facebook-access-token'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-openid'
gem 'omniauth-google-apps'

gem 'uuidtools'

gem 'dynamic_form'

gem 'high_voltage'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass'
  # gem 'therubyracer' #heroku says unnesecary but I need it for less to work
  gem 'coffee-rails', "~> 3.2.1"
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

# Bundle the extra gems:
gem 'RedCloth', '~> 4.2.9', :require => 'redcloth'
gem 'ruby-openid', :require => 'openid'
gem 'rack-openid', :require => 'rack/openid'
gem 'aaronh-chronic', :require => 'chronic' # Fixes for 1.9.2
gem 'coderay'
gem 'lesstile'
gem 'formtastic'
# gem 'will_paginate'
# gem 'bootstrap-will_paginate'
gem 'kaminari'
gem 'exception_notification', '~> 2.5.2'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :test do
  gem 'database_cleaner'
  gem 'cucumber-rails',    :require => false
  gem 'cucumber-websteps', :require => false
  gem 'factory_girl'
  gem 'rspec'
  # gem 'nokogiri', '~> 1.5.0'
  gem 'webrat'
  gem 'sqlite3'
  gem 'mailcatcher'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'aaronh-chronic'
  gem 'rails-footnotes', '>= 3.7.5.rc4', :group => :development
end
