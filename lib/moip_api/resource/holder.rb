module Moip
  module Resource
    class Holder
      include ActiveData::Model

      attribute :fullname, type: String
      attribute :birthdate, type: String
      attribute :phone, type: Hash
      attribute :taxDocument, type: Hash
      attribute :billingAddress, type: Hash
    end
  end
end
