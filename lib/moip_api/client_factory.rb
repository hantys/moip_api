module Moip
	class ClientFactory

		def initialize
		end

		def default_basic
			# token, secret = READ from yml
      auth = Moip::Auth::Basic.new
			client = Moip::Client.new(Moip.environment, auth)
		end

		def default_oauth
			auth = Moip::Auth::OAuth.new
			client = Moip::Client.new(Moip.environment, auth)
		end

		def connect_basic
			auth = Moip::Auth::Basic.new
			client = Moip::Client.new(Moip.environment, auth, :connect)
		end
	end
end

