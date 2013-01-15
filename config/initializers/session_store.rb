# Be sure to restart your server when you modify this file.

# StEnki::Application.config.session_store :cookie_store, :key => '_enki_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# CodeConcoction::Application.config.session_store :active_record_store

# Be sure to restart your server when you modify this file.

StEnki::Application.config.session_store :cookie_store

StEnki::Application.config.session = {
  :key          => '_omniauthpure_session',     # name of cookie that stores the data
  :domain       => nil,                         # you can share between subdomains here: '.communityguides.eu'
  :expire_after => 1.month,                     # expire cookie
  :secure       => false,                       # fore https if true
  :httponly     => true,                        # a measure against XSS attacks, prevent client side scripts from accessing the cookie
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# OmniauthDemo::Application.config.session_store :active_record_store
