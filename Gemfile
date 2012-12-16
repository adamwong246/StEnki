source 'https://rubygems.org'
ruby '1.9.3'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'rails', '3.2.0'
# gem "heroku"
gem "thin", "~> 1.4.1"
# gem 'bootstrap-generators', '~> 2.0' # for less to work
gem 'simple_form', '~> 2.0'
gem 'slim'
gem 'rails_admin'#, :git => 'git@github.com:sferik/rails_admin.git' #:path =>'~/PersonalProgramming/rails_admin'
gem "rails_admin_nestable", git: "git://github.com/dalpo/rails_admin_nestable.git" #:path =>'~/PersonalProgramming/rails_admin_nestable'#git: "git://github.com/dalpo/rails_admin_nestable.git"
gem 'ancestry'

gem 'sextant'#, :path => "~/PersonalProgramming/sextant"#, :git => "git://github.com/rschwarzkopf/sextant.git"
# gem "acts_as_tree_rails3", "~> 0.1.0"

gem 'devise'
gem "cancan"
gem 'jquery-rails'

gem 'bootswatch-rails'

# gem 'lorem'
gem 'faker'

# gem "rails-settings-cached"
# gem 'ledermann-rails-settings', :require => 'rails-settings'
# gem "rails-settings", :git => "git://github.com/100hz/rails-settings.git"

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-openid'
gem 'omniauth-google-apps'


# doesn't seem to work
# gem 'truncate_html'
# for truncation_html_helper @ "git://github.com/ianwhite/truncate_html.git
gem "nokogiri"
gem "htmlentities"

# static pages
gem 'high_voltage'

gem "chunky_png"

gem 'dalli', '~>1.0.5'

# gem "seed-fu", "~> 2.2.0"

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
