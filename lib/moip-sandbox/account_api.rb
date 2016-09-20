module Moip
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
			@doc = Nokogiri::XML.parse(@response.to_s)
			@account = Moip::Parser::AccountParser.parse(@doc)
			@account
		end
	end
end