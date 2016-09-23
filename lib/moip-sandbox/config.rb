module Moip
	class Config
		attr_accessor :api_token, :api_secret, :app_id, :app_access_token, :app_secret, :app_redirect_uri

		def initialize
		end

		# def initialize(api_token, api_secret, app_id, app_access_token, app_secret, app_redirect_uri)
		# 	@api_token, @api_secret, @app_id, @app_access_token, @app_secret, @app_redirect_uri = api_token, api_secret, app_id, app_access_token, app_secret, app_redirect_uri
		# end
	end
end