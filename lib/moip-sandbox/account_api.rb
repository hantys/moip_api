module Moip
	module V1
		class AccountAPI
			attr_reader :client

			def initialize(client)
				@client = client
			end

			def base_path
				"/ws/alpha/VerificarConta/"
			end

			def find(email)
				@response = client.get("#{base_path}/#{email}")
				@response
			end
		end
	end

	module V2
		class AccountAPI
			def base_path
				#
			end
		end
	end
end