module Moip
  module Resource
    class CreditCard
      include ActiveData::Model

      attribute :id, type: String
      attribute :hash, type: String
      attribute :number, type: String
      attribute :expirationMonth, type: String
      attribute :expirationYear, type: String
      attribute :cvc, type: String
      attribute :holder, type: Object
    end
  end
end
