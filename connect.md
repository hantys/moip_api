# Solicitar conexão da conta
https://connect-sandbox.moip.com.br/oauth/authorize?response_type=code&client_id=APP-M11STAPPOAUt&redirect_uri=https://url.com.br/callback.php&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO
I
```
module Moip
	module Connect
		class PermissionAPI
			attr_reader :app_id, :callback_url, :client
			
			def initialize(client)
				@app_id = @conf["app_id"]
				@app_id = @conf["callback_url"]
			end

			def get_request_permission_uri
				@host = "https://connect-sandbox.moip.com.br/oauth/authorize"
				@params = "?response_type=code&client_id=#{@app_id}&redirect_uri=#{@callback_url}&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO"
			end
		end

		class UserTokenAPI
			attr_redader :client

			def initialize(client)
				@client = client
			end

			def generate_token(permission, params)
				@client.post "/oauth/token", params
			end
		end
	end
end

module Moip
	module Resource
		class Permission
			attr_reader :code, :scope
		end

		class UserToken
		end
	end
end
```
# Criar e debugar resposta
http://meusite.com.br/?code=ohgrvfk2kdq92w27w66mlntasfh24je&scope=RECEIVE_FUNDS+REFUND+MANAGE_ACCOUNT_INFO+RETRIEVE_FINANCIAL_INFO

# /auth/moip
def moip
	@code = params[:code]
end
