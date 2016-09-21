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
          return user
        end
		end
	end
end