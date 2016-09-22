module Moip
	class Api
		attr_reader :factory

		def initialize
			factory = ClientFactory
		end

		def connect
			Moip::V2::AuthTokenAPI.new(factory.connect_basic)
		end

		def account
			Moip::V1::AccountToken.new(factory.default_basic)
		end
	end
end




