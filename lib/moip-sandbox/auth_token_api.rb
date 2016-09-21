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

			def get_permission_uri
				# TODO: Read values form yaml file
				@app_id = ""
				@redirect_uri = ""
				@host = "https://connect-sandbox.moip.com.br/oauth/authorize"
				@params = "response_type=code&client_id=#{@app_id}&redirect_uri=#{@callback_url}&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO"
				"#{@host}?#{@params}"
			end

			## Inserir no controller para gerar o token
			## /auth/moip
			# def moip
			#	@code = params[:code]
			#	AuthTokenAPI.generate_token(code)
			# end

			def generate_token(code)
				# TODO: Read from .yaml file
				params = {
					code: code,
					client_id: "",
					client_secret: "",
					redirect_uri: "",
					grant_type: "authotization_code"
				}
				@response = client.post("#{base_path}/token", params)
				Resource::User.new @response
			end
		end
	end
end
