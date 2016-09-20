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

    def self.new_account(params)
      @response = Moip::Request.new_account_request("https://sandbox.moip.com.br/v2", "/accounts")
      {
        "email": {
            "address": "DOBXERG0a8@labs.moip.com.br"
        },
        "person": {
            "name": "Runscope",
            "lastName": "Random 9123",
            "taxDocument": {
                "type": "CPF",
                "number": "742.520.863-61"
            },
              "identityDocument": {
              "type" : "RG",
              "number": "434322344",
              "issuer": "SSP",
              "issueDate": "2000-12-12"
              },
            "birthDate": "1990-01-01",
            "phone": {
                "countryCode": "55",
                "areaCode": "11",
                "number": "965213244"
            },
            "address": {
                "street": "Av. Brigadeiro Faria Lima",
                "streetNumber": "2927",
                "district": "Itaim",
                "zipCode": "01234-000",
                "city": "São Paulo",
                "state": "SP",
                "country": "BRA"
            }
        },
        "type": "MERCHANT"
      }
    end
	end
end