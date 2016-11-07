Moip.configure do |config|
  config.api_token=ENV['MOIP_TOKEN']
  config.api_secret=ENV['MOIP_SECRET']
  config.app_id = ENV['APP_ID'] 
  config.app_access_token = ENV['APP_ACCESS_TOKEN'] 
  config.app_secret = ENV['APP_SECRET']
  config.app_redirect_uri = ENV['APP_REDIRECT_URI']
  config.environment = :development
end
