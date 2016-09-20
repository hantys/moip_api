require "base64"

module Moip
	module Auth
		class Basic

			def initialize(token, secret)
				@token, @secret = token, secret
			end

			def header
				%(Basic #{Base64.strinct_encode("#{@token}:#{@secret}")})
			end
		end
	end
end