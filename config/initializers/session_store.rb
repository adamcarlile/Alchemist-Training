# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_alchemist-training_session',
  :secret      => '2254f873b49c85ccddf8f99f77648a70b2e26de85c2338e854b571cb22d4b258131185487f5239cdfde42bb630f019d7e41e55e3c14e30dc2b3e999617ebe71a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
