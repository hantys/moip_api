module Moip
  module Resource
    class Customer
      include ActiveData::Model

      attribute :id, type: String
      attribute :ownId, type: String
      attribute :fullname, type: String
      attribute :email, type: String
      attribute :birthDate, type: String
      attribute :taxDocument, type: Hash
      attribute :phone, type: Hash
      attribute :shippingAddress, type: Object
    end
  end
end
