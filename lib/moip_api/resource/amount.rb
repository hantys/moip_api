module Moip
  module Resource
    class Amount
      include ActiveData::Model
      
      attr_accessor :currency, :subtotals
      

    end
  end
end
