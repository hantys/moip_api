module Moip
  module Resource
    class Holder
      include ActiveData::Model

      attribute :fullName, type: Object
      attribute :birthdate, type: String
      attribute :phone, type: Hash
      attribute :taxDocument, type: Hash
      attribute :billingAddress, type: Hash
    end
  end
end
