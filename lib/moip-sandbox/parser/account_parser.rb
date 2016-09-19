module Moip
	module Parser
		class AccountParser
			def self.parse(response)
				status = response.xpath("//Status").first.content
				type = response.xpath("//Tipo").xpath("//Codigo").first.content
				Moip::Resource::Account.new(status, type)
			end
		end		
	end
end