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
				if client.production?
					""
				else
					"https://connect-sandbox.moip.com.br"
				end
			end

			def get_permission_uri
				# TODO: Read values form yaml file
				@app_id = "APP-IYDQO7981OKQ"
				@redirect_uri = "http://teste.ruaalecrim.com.br/auth/moip"
				@host = "#{get_connect_base_uri}/oauth/authorize"
				@params = "response_type=code&client_id=#{@app_id}&redirect_uri=#{@redirect_uri}&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO"
				"#{@host}?#{@params}"
			end

			def generate_token(code)
				# TODO: Read from .yaml file
				params = URI.encode_www_form([
					["code", code],
					["client_id", "APP-IYDQO7981OKQ"],
					["client_secret", "071f4f6be2ca47e0bdc4f7d9242273f2"],
					["redirect_uri", "http://teste.ruaalecrim.com.br/auth/moip"],
					["grant_type", "authorization_code"]
				])

				auth = Auth::Basic.new 'YJNG2JJ7EF9D04DOMTGE8T6ZC2TCZACD', 'L4BH67OEOPX8L8KKH9HTTSWMCFZH5H2BYS18FOUK'

				header = {
					"Content-Type": "application/x-www-form-urlencoded",
					"Authorization": auth.header
				}
				@response = client.post("#{base_path}/token", params, header)
				return Response.new @response, @response
			end
		end
	end
end
