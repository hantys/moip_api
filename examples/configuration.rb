# Moip.configure do |config|
#   config.api_token=ENV['MOIP_TOKEN']
#   config.api_secret=ENV['MOIP_SECRET']
#   config.app_id = ENV['APP_ID']
#   config.app_access_token = ENV['APP_ACCESS_TOKEN']
#   config.app_secret = ENV['APP_SECRET']
#   config.app_redirect_uri = ENV['APP_REDIRECT_URI']
#   config.environment = :development
# end
Moip.configure do |config|
  config.api_token        = "DUZIEAKJWKFDZCRYVNN2OG3VB2N2AC7R"
  config.api_secret       = "5VFE7OWMHYRPONIPROHUU2HNOO6WG3KCMRNCF6AU"
  config.app_id           = 'App-123123k'
  config.app_access_token = '96236c8ce7944d80a98cf64ea7f3f2e5_v'
  config.app_secret       = '96236c8ce7944d80a98cf64ea7f3f2e5_v'
  config.app_redirect_uri = '127.0.0.1:3000/teste'
  config.environment      = :development
end