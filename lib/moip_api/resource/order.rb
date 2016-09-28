module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :own_id, type: String
      attribute :customer, type: Object # Pode ser o id  de um cliente ja existente ou um novo cliente
      attribute :amount, type: Object
      attribute :receivers, type: Array
      attribute :items, type: Array

    end
  end
end