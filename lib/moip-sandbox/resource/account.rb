module Moip
	module Resource
		class Account 
			def self.find_account(email)
				@email = "renatosousafilho@gmail.com"
				@response = Moip::Request.build_request(:get, "https://desenvolvedor.moip.com.br/sandbox/ws/alpha", "/VerificarConta/#{@email}")
				@doc = Nokogiri::XML.parse(@response.to_s)
				@doc
			end
		end
	end
end