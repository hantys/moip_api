require "base64"

module Moip
	module Auth
		class Basic

			def initialize(token, secret)
				@token, @secret = token, secret
			end

			def header
				%(Basic #{Base64.strict_encode64("#{@token}:#{@secret}")})
			end
		end

		class Oauth

			def initialize(secret)
				@secret = secret
			end

			def header
				%(OAuth #{@secret})
			end
		end
	end
end