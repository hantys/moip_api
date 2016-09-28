module Moip
  module Resource
    class Amount
      include ActiveData::Model

      attribute :currency, type: String, default: 'BRL'
      attribute :subtotals, type: Hash


    end
  end
end
