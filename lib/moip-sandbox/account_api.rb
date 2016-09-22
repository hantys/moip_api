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
        @response = client.post(base_path, user.to_json)
        return Response.new @response, @response.parsed_response
      end

      def find(moip_id)
        @response = client.get("#{base_path}/#{moip_id}")
        Response.new @response, @response
      end
		end
	end
end