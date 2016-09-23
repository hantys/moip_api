module Moip
	module Resource
		class Account < SimpleDelegator
			attr_accessor :status, :type

			def initialize(status, type)
				self.status = status
				self.type = type
			end
		end
	end
end