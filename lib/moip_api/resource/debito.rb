module Moip
	module Resource
		class Debito

			include ActiveData::Model

      attribute :bankNumber, type: String
      attribute :expirationDate, type: String
      attribute :returnUri, type: String
		end
	end
end
