module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :ownId, type: String
      attribute :customer, type: Object # Pode ser o id  de um cliente ja existente ou um novo cliente
      attribute :amount, type: Object
      attribute :receivers, type: Array, default: []
      attribute :items, type: Array

    end
  end
end