source 'https://rubygems.org'

gem 'rails', '3.2.0'

gem "thin", "~> 1.4.1"

gem 'bootstrap-generators', '~> 2.0' # for less to work
gem 'simple_form', '~> 2.0'

gem 'slim'

gem 'less-rails'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass'
  gem 'therubyracer' #heroku says unnesecary but I need it for less to work
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

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
gem 'RedCloth', '~> 4.2.9', :require => 'redcloth'
gem 'ruby-openid', :require => 'openid'
gem 'rack-openid', :require => 'rack/openid'
gem 'aaronh-chronic', :require => 'chronic' # Fixes for 1.9.2
gem 'coderay'
gem 'lesstile'
gem 'formtastic'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'exception_notification', '~> 2.5.2'
gem 'open_id_authentication'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :test do
  gem 'database_cleaner'
  gem 'cucumber-rails',    :require => false
  gem 'cucumber-websteps', :require => false
  gem 'factory_girl'
  gem 'rspec'
  gem 'nokogiri', '~> 1.5.0'
  gem 'webrat'
  gem 'sqlite3'
  gem 'mailcatcher'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'aaronh-chronic'
end
