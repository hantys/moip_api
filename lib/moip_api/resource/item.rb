module Moip
  module Resource
    class Item
      include ActiveData::Model

      attribute :detail, type: String
      attribute :quantity, type: Integer
      attribute :price, type: Integer
      attribute :product, type: String
    end
  end
end
