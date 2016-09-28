module Moip
  module Resource
    class Receiver
      include ActiveData::Model

      attribute :type, type: String
      attribute :moipAccount, type: Hash
      attribute :amount, type: Hash
    end
  end
end
