module Moip
	class ClientFactory
		attr_reader :token, :secret, :acess_token

		def initialize
			#token, secret, acess_token = ,,
		end

		def default_basic
			# token, secret = READ from yml
			auth = Moip::Auth::Basice.new(token, secret)
			client = Moip::Client.new(:sandbox, auth)
		end

		def default_ouath
			auth = Moip::Auth::Ouath.new(acess_token)
			client = Moip::Client.new(:sandbox, )
		end

		def connect_basic
			auth = Moip::Auth::Basic.new(token, secret)
			client = Moip::Client.new(:sandbox, auth, :connect)
		end
	end
end

