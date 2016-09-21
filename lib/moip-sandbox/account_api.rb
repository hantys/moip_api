module Moip
	module V1
		class AccountAPI
			attr_reader :client, :user

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
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        '/accounts'
      end

      def create_account(user)
        # @user = Moip::Resource::User.new(user) if user
        @response = client.post(base_path, user.get_json)
        return set_obj_response user, @response
      end

      private

        def set_obj_response(user, params)
          if params['errors']
            return set_error(params)
          else
            return set_user(user, params)
          end
        end

        def set_error(params)
          # {"errors"=>[{"code"=>"REG-002", "path"=>"v2/accounts", "description"=>"Tax document has already been taken!"}], "additionalInfo"=>{"account"=>{"id"=>"MPA-1CC778A102DF", "email"=>"souripto2r@hotmail.com", "login"=>"souripto2r@hotmail.com"}}}
          errors = params['errors'][0]
          account = params['additionalInfo']['account']
          @error = Moip::Resource::Error.new errors['code'], errors['description'], account['id'], account['email'], account['login']
          return @error
        end

        def set_user(user, params)
          data = params.parsed_response
          # {"id"=>"MPA-D84C264E01B1", "login"=>"souripto4r@hotmail.com", "accessToken"=>"3e89e1430ef941c28a2732c41b6cf895_v2", "channelId"=>"APP-IYDQO7981OKQ", "type"=>"MERCHANT", "transparentAccount"=>false, "email"=>{"address"=>"souripto4r@hotmail.com", "confirmed"=>false}, "person"=>{"name"=>"Pedro", "lastName"=>"Fausto", "birthDate"=>"1982-12-28", "taxDocument"=>{"type"=>"CPF", "number"=>"743.845.930-66"}, "address"=>{"street"=>"rua epitacio pessoa", "streetNumber"=>"1240", "district"=>"lourival", "zipcode"=>"64023400", "zipCode"=>"64023400", "city"=>"teresina", "state"=>"PI", "country"=>"BRA"}, "phone"=>{"countryCode"=>"55", "areaCode"=>"86", "number"=>"994211487"}}, "createdAt"=>"2016-09-21T12:55:49.120Z", "_links"=>{"self"=>{"href"=>"https://sandbox.moip.com.br/moipaccounts/MPA-D84C264E01B1", "title"=>nil}, "setPassword"=>{"href"=>"https://desenvolvedor.moip.com.br/sandbox/AskForNewPassword.do?method=confirm&email=souripto4r%40hotmail.com&code=b87beb7528030ceb51f9c001d3b85fa5"}}}
          return user
        end
		end
	end
end