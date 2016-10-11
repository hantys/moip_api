require 'uri'

module	Moip
	module V2
		class AuthTokenAPI
			attr_reader :client

			def initialize(client)
				@client = client
			end

			def base_path
				"/oauth"
			end

			def get_connect_base_uri
				if Moip.environment == :production
					""
				else
					"https://connect-sandbox.moip.com.br"
				end
			end

			def get_permission_uri
				# TODO: Read values form yaml file

				@app_id = Moip.app_id
				@redirect_uri = Moip.app_redirect_uri
				@host = "#{get_connect_base_uri}/oauth/authorize"
				@params = "response_type=code&client_id=#{@app_id}&redirect_uri=#{@redirect_uri}&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO"
				"#{@host}?#{@params}"
			end

			def generate_token(code)
				# TODO: Read from .yaml file
				params = URI.encode_www_form([
					["code", code],
					["client_id", Moip.app_id],
					["client_secret", Moip.app_secret],
					["redirect_uri", Moip.app_redirect_uri],
					["grant_type", "authorization_code"]
				])

				auth = Auth::Basic.new

				header = {
					"Content-Type": "application/x-www-form-urlencoded",
					"Authorization": auth.header
				}
				@response = client.post("#{base_path}/token", params, header)
				@response
			end
		end
	end
end
