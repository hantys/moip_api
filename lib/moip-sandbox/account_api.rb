module Moip
	class AccountAPI
		def self.find_account(email)
			@response = Moip::Request.build_request(:get, "https://desenvolvedor.moip.com.br/sandbox/ws/alpha", "/VerificarConta/#{email}")
			@doc = Nokogiri::XML.parse(@response.to_s)
			@account = Moip::Parser::AccountParser.parse(@doc)
			@account
		end
	end
end