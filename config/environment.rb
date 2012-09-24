# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Coolxueyuan::Application.initialize!
ActionController::Base.cache_store = :file_store, "./public/view_cache"
