module Moip
  module Resource
    class Item
      include ActiveData::Model

      attribute :detail, type: String
      attribute :quantitt, type: Integer
      attribute :price, type: Integer
      attribute :product, type: String
    end
  end
end
