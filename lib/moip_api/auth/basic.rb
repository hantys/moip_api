require "base64"

module Moip
	module Auth
		class Basic

			def initialize
				@token, @secret = Moip.api_token, Moip.api_secret

			end

			def header
				%(Basic #{Base64.strict_encode64("#{@token}:#{@secret}")})
			end
		end
	end
end