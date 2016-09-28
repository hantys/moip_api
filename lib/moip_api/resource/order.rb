module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :amount, type: Object
      attribute :receivers, type: Array
      attribute :items, type: Array
      attribute :addresses, type: Array

    end
  end
end