module Moip
  module Resource

    class Address
      include ActiveData::Model

      attribute :city, type: String
      attribute :complement, type: String
      attribute :street, type: String
      attribute :streetNumber, type: String
      attribute :zipCode, type: String
      attribute :district, type: String
      attribute :state, type: String
      attribute :type, type: String
      attribute :country, type: String

    end
  end
end

