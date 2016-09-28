module Moip
  module Resource
    class Amount
      include ActiveData::Model
      
      attribute :currency, type: String
      attribute :subtotals, type: Hash
      

    end
  end
end
